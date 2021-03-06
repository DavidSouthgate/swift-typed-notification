#if os(watchOS)
import WatchKit

public extension WKInterfaceController  {
 
    func post<N : TypedNotification>(_ notification: N) {
        NotificationCenter.default.post(notification)
    }
    
    func post(_ name: Notification.Name, sender: Any) {
        NotificationCenter.default.post(name: name, object: sender)
    }
    
    @discardableResult
    func addObserver<N>(_ forType: N.Type, queue: OperationQueue? = nil, using block: @escaping (N) -> Void) -> NSObjectProtocol where N : TypedNotification {
        return NotificationCenter.default.addObserver(forType, using: block)
    }
    
    @discardableResult
    func addObserver(_ name: Notification.Name, using block: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return NotificationCenter.default.addObserver(forName: name, using: block)
    }
    
    func removeObserver(_ observer: NSObjectProtocol) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    func removeObservers(_ observers: [NSObjectProtocol]) {
        NotificationCenter.default.removeObservers(observers)
    }
}
#endif
