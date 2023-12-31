//
//  SettingToggleView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

struct SettingToggleView: View {

    @Environment(\.edgePadding) private var edgePadding

    let title: String
    @Binding var isOn: Bool

    let icon: SettingIcon?
    let horizontalSpacing: CGFloat
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat?

    init(
        icon: SettingIcon? = nil,
        title: String,
        isOn: Binding<Bool>,
        horizontalSpacing: CGFloat = Constants.horizontalSpacing,
        verticalPadding: CGFloat = Constants.verticalPadding,
        horizontalPadding: CGFloat? = .none
    ) {
        self.icon = icon
        self.title = title
        _isOn = isOn
        self.horizontalSpacing = horizontalSpacing
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }

    var body: some View {
        HStack(spacing: horizontalSpacing) {
            if let icon {
                SettingIconView(icon: icon)
            }
            
            Text(title)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, verticalPadding)

            Toggle("", isOn: $isOn)
                .labelsHidden()
        }
        .padding(.horizontal, horizontalPadding ?? edgePadding)
        .accessibilityElement(children: .combine)
    }
}
