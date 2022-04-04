import Foundation
import Combine

public protocol TypedNotification {
    associatedtype Sender
    static var name: Notification.Name { get }
    var sender: Sender { get }
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public typealias TypedNotificationPublisher<N> = AnyPublisher<N, Never>

public protocol TypedNotificationCenter {

    func post<N : TypedNotification>(_ notification: N)

    @discardableResult
    func addObserver<N : TypedNotification>(_ forType: N.Type, sender: N.Sender?,
                                            queue: OperationQueue?, using block: @escaping (N) -> Void) -> NSObjectProtocol
    
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher<N>(for type: N.Type, object: AnyObject?) -> TypedNotificationPublisher<N> where N : TypedNotification
}

extension NotificationCenter : TypedNotificationCenter {
    public static var typedNotificationUserInfoKey = "_TypedNotification"

    public func post<N>(_ notification: N) where N : TypedNotification {
        post(name: N.name, object: notification.sender,
             userInfo: [
                NotificationCenter.typedNotificationUserInfoKey : notification
        ])
    }
    
    @discardableResult
    public func addObserver(forName name: NSNotification.Name?, using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: block)
    }
    
    @discardableResult
    public func addObserver<N>(_ forType: N.Type, sender: N.Sender? = nil, queue: OperationQueue? = nil, using block: @escaping (N) -> Void) -> NSObjectProtocol where N : TypedNotification {
        return addObserver(forName: N.name, object: sender, queue: queue) { n in
            guard let typedNotification = n.userInfo?[NotificationCenter.typedNotificationUserInfoKey] as? N else {
                fatalError("Could not construct a typed notification: \(N.name) from notification: \(n)")
            }

            block(typedNotification)
        }
    }
    
    public func removeObservers(_ observers: [NSObjectProtocol]) {
        for observer in observers {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func publisher<N>(for type: N.Type, object: AnyObject? = nil) -> TypedNotificationPublisher<N> where N : TypedNotification {
        return self.publisher(for: type.name)
            .map { n -> N in
                guard let typedNotification = n.userInfo?[NotificationCenter.typedNotificationUserInfoKey] as? N else {
                    fatalError("Could not construct a typed notification: \(N.name) from notification: \(n)")
                }
                return typedNotification
            }
            .eraseToAnyPublisher()
    }
}
