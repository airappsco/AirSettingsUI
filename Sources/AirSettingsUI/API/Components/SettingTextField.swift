import SwiftUI

/**
 A text field.
 */
public struct SettingTextField: View, AirSetting {

    public let id: AnyHashable?
    public let placeholder: String
    @Binding public var text: String
    public let verticalPadding: CGFloat
    public let horizontalPadding: CGFloat?

    public init(
        id: AnyHashable? = nil,
        placeholder: String,
        text: Binding<String>,
        verticalPadding: CGFloat = Constants.verticalPadding,
        horizontalPadding: CGFloat? = nil
    ) {
        self.id = id
        self.placeholder = placeholder
        self._text = text
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }

    public var body: some View {
        SettingTextFieldView(
            placeholder: placeholder,
            text: $text,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding
        )
    }
}
