//
//  SettingRowButtonStyle.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

/**
 A button style that highlights the row when tapped.
 */
@available(iOS 13.0, *)
struct SettingRowButtonStyle: ButtonStyle {
    @Environment(\.settingPrimaryColor) var settingPrimaryColor

    public func makeBody(configuration: Configuration) -> some View {
        if #available(iOS 15.0, *) {
            configuration.label
                .contentShape(Rectangle())
                .background {
                    if configuration.isPressed {
                        settingPrimaryColor
                            .opacity(0.1)
                    }
                }
        } else {
            configuration.label
                .contentShape(Rectangle())
        }
    }
}

@available(iOS 13.0, *)
extension ButtonStyle where Self == SettingRowButtonStyle {
    static var row: SettingRowButtonStyle {
        SettingRowButtonStyle()
    }
}
