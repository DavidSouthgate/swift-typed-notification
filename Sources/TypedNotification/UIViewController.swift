#if os(iOS)
import UIKit

public extension UIViewController  {
 
    func post<N : TypedNotification>(_ notification: N) {
        NotificationCenter.default.post(notification)
    }
    
    @discardableResult
    func addObserver<N>(_ forType: N.Type, queue: OperationQueue? = nil, using block: @escaping (N) -> Void) -> NSObjectProtocol where N : TypedNotification {
        return NotificationCenter.default.addObserver(forType, using: block)
    }

    @discardableResult
    public func addObserver(forName name: NSNotification.Name?, using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: block)
    }
    
    func removeObserver(_ observer: NSObjectProtocol) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    func removeObservers(_ observers: [NSObjectProtocol]) {
        NotificationCenter.default.removeObservers(observers)
    }
}
#endif
