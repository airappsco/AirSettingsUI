//
//  SettingToggle.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

/**
 A simple toggle.
 */
@available(iOS 15.0, *)
public struct SettingToggle: View, AirSetting {
    public let id: AnyHashable?
    public let title: String
    @Binding public var isOn: Bool
    public let horizontalSpacing: CGFloat
    public let verticalPadding: CGFloat
    public let horizontalPadding: CGFloat?
    public let icon: SettingIcon?

    public init(
        id: AnyHashable? = nil,
        icon: SettingIcon?,
        title: String,
        isOn: Binding<Bool>,
        horizontalSpacing: CGFloat = Constants.horizontalSpacing,
        verticalPadding: CGFloat = Constants.verticalPadding,
        horizontalPadding: CGFloat? = nil
    ) {
        self.id = id
        self.icon = icon
        self.title = title
        self._isOn = isOn
        self.horizontalSpacing = horizontalSpacing
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }

    public var body: some View {
        SettingToggleView(
            icon: icon,
            title: title,
            isOn: $isOn,
            horizontalSpacing: horizontalSpacing,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding
        )
    }
}
