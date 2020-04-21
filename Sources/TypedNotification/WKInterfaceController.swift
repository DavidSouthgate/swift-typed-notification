#if os(watchOS)
import WatchKit

public extension WKInterfaceController  {
 
    func post<N : TypedNotification>(_ notification: N) {
        NotificationCenter.default.post(notification)
    }
    
    func post(_ name: Notification.Name, sender: Any) {
        NotificationCenter.default.post(name: name, object: sender)
    }
    
    func addObserver<N>(_ forType: N.Type, queue: OperationQueue? = nil, using block: @escaping (N) -> Void) where N : TypedNotification {
        _ = NotificationCenter.default.addObserver(forType, sender: nil, queue: nil, using: block)
    }
    
    func addObserver(_ name: Notification.Name, using block: @escaping (Notification) -> Void) {
        _ = NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: block)
    }
}
#endif
