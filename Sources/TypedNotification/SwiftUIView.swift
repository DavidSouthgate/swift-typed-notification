#if canImport(SwiftUI)
import SwiftUI
/*
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    @inlinable public func onReceive<N>(_ forType: N.Type, perform action: @escaping (N) -> Void) -> some View  where N : TypedNotification {
        let publisher = NotificationCenter.default.publisher(for: forType.name)
        return self.onReceive(publisher, perform: { n in
            guard let typedNotification = n.userInfo?[NotificationCenter.typedNotificationUserInfoKey] as? N else {
                fatalError("Could not construct a typed notification: \(N.name) from notification: \(n)")
            }
            action(typedNotification)
        })
    }

    @inlinable public func onReceive(_ name: NSNotification.Name, perform action: @escaping (Notification) -> Void) -> some View {
        let publisher = NotificationCenter.default.publisher(for: name)
        return self.onReceive(publisher, perform: action)
    }
}*/

#endif
