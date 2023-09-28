//
//  SettingButton.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

/**
 A plain button.
 */
public struct SettingButton: View, AirSetting {
    public let id: AnyHashable?
    public var icon: SettingIcon?
    public let title: String
    public var indicator: String?
    public let horizontalSpacing: CGFloat
    public let verticalPadding: CGFloat
    public let horizontalPadding: CGFloat?
    public let action: () -> Void

    public init(
        id: AnyHashable? = nil,
        icon: SettingIcon? = nil,
        title: String,
        indicator: String? = Constants.touchUpIconName,
        horizontalSpacing: CGFloat = Constants.horizontalSpacing,
        verticalPadding: CGFloat = Constants.verticalPadding,
        horizontalPadding: CGFloat? = nil,
        action: @escaping () -> Void
    ) {
        self.id = id
        self.icon = icon
        self.title = title
        self.indicator = indicator
        self.horizontalSpacing = horizontalSpacing
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.action = action
    }

    public var body: some View {
        SettingButtonView(
            icon: icon,
            title: title,
            indicator: indicator,
            horizontalSpacing: horizontalSpacing,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding,
            action: action
        )
    }
}

public extension SettingButton {
    func icon(_ icon: String, color: Color = .blue) -> SettingButton {
        var button = self
        button.icon = .system(icon: icon, backgroundColor: color)
        return button
    }

    func icon(_ icon: String, foregroundColor: Color = .white, backgroundColor: Color = .blue) -> SettingButton {
        var button = self
        button.icon = .system(icon: icon, foregroundColor: foregroundColor, backgroundColor: backgroundColor)
        return button
    }

    func icon(icon: SettingIcon) -> SettingButton {
        var button = self
        button.icon = icon
        return button
    }

    func indicator(_ indicator: String) -> SettingButton {
        var button = self
        button.indicator = indicator
        return button
    }
}
