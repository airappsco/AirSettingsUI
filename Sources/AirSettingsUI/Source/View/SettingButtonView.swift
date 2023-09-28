//
//  SettingButtonView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

struct SettingButtonView: View {

    @Environment(\.edgePadding) private var edgePadding
    @Environment(\.settingSecondaryColor) private var settingSecondaryColor

    let icon: SettingIcon?
    let title: String
    let indicator: String?
    let horizontalSpacing: CGFloat
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat?
    let action: () -> Void

    init(
        icon: SettingIcon? = nil,
        title: String,
        indicator: String? = Constants.touchUpIconName,
        horizontalSpacing: CGFloat = Constants.horizontalSpacing,
        verticalPadding: CGFloat = Constants.verticalPadding,
        horizontalPadding: CGFloat? = nil,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.title = title
        self.indicator = indicator
        self.horizontalSpacing = horizontalSpacing
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: horizontalSpacing) {
                if let icon {
                    SettingIconView(icon: icon)
                }

                Text(title)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, verticalPadding)

                if let indicator {
                    Image(systemName: indicator)
                        .foregroundColor(settingSecondaryColor)
                }
            }
            .padding(.horizontal, horizontalPadding ?? edgePadding)
            .accessibilityElement(children: .combine)
        }
        .buttonStyle(.row)
    }
}
