#if os(iOS)
import UIKit

public extension UIViewController  {
 
    func post<N : TypedNotification>(_ notification: N) {
        NotificationCenter.default.post(notification)
    }
    
    func addObserver<N>(_ forType: N.Type, queue: OperationQueue? = nil, using block: @escaping (N) -> Void) -> NSObjectProtocol where N : TypedNotification {
        return NotificationCenter.default.addObserver(forType, sender: nil, queue: nil, using: block)
    }
    
    func removeObserver(_ observer: NSObjectProtocol) {
        NotificationCenter.default.removeObserver(observer)
    }
}
#endif