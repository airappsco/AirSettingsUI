import SwiftUI

/**
 A button style that highlights the row when tapped.
 */
struct SettingRowButtonStyle: ButtonStyle {
    @Environment(\.settingPrimaryColor) var settingPrimaryColor

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .contentShape(Rectangle())
            .background {
                if configuration.isPressed {
                    settingPrimaryColor
                        .opacity(0.1)
                }
            }
    }
}

extension ButtonStyle where Self == SettingRowButtonStyle {
    static var row: SettingRowButtonStyle {
        SettingRowButtonStyle()
    }
}
