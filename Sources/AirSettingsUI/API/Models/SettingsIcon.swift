import SwiftUI

/**
 An general purpose icon view.
 */
public enum SettingIcon {

    case system(
        icon: String,
        foregroundColor: Color = .white,
        backgroundColor: Color
    )

    /// Pass in a `foregroundColor` to render and recolor the image as a template.
    case image(
        _ image: Image,
        inset: CGFloat,
        foregroundColor: Color?,
        backgroundColor: Color
    )

    case custom(view: AnyView)
}
