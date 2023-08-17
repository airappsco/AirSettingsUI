import SwiftUI

extension View {
    var asUIKitView: UIView {
        UIHostingController(rootView: self).view
    }
}
