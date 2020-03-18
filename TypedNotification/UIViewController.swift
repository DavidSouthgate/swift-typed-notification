#if canImport(UIKit)
import UIKit

public extension UIViewController  {
 
    func post<N : TypedNotification>(_ notification: N) {
        NotificationCenter.default.post(notification)
    }
    
    func addObserver<N>(_ forType: N.Type, queue: OperationQueue? = nil, using block: @escaping (N) -> Void) where N : TypedNotification {
        _ = NotificationCenter.default.addObserver(forType, sender: nil, queue: nil, using: block)
    }
}
#endif
