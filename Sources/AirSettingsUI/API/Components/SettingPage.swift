//
//  SettingPage.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

/**
 A settings page.
 */
@available(iOS 13.0, *)
public struct SettingPage: AirSetting {
    public let id: AnyHashable?
    public let title: String
    public let selectedChoice: String?
    public let spacing: CGFloat
    public let verticalPadding: CGFloat
    public let backgroundColor: Color?
    public let navigationTitleDisplayMode: NavigationTitleDisplayMode
    public var previewConfiguration: PreviewConfiguration
    @SettingBuilder public let tuple: SettingTupleView

    public init(
        id: AnyHashable? = nil,
        title: String,
        selectedChoice: String? = nil,
        spacing: CGFloat = 20,
        verticalPadding: CGFloat = 6,
        backgroundColor: Color? = nil,
        navigationTitleDisplayMode: SettingPage.NavigationTitleDisplayMode = NavigationTitleDisplayMode.automatic,
        previewConfiguration: SettingPage.PreviewConfiguration = PreviewConfiguration(),
        @SettingBuilder tuple: () -> SettingTupleView
    ) {
        self.id = id
        self.title = title
        self.selectedChoice = selectedChoice
        self.spacing = spacing
        self.verticalPadding = verticalPadding
        self.backgroundColor = backgroundColor
        self.navigationTitleDisplayMode = navigationTitleDisplayMode
        self.previewConfiguration = previewConfiguration
        self.tuple = tuple()
    }

    public struct PreviewConfiguration {
        public var icon: SettingIcon?
        public var indicator: String
        public let horizontalSpacing: CGFloat
        public let verticalPadding: CGFloat
        public let horizontalPadding: CGFloat?

        public init(
            icon: SettingIcon? = nil,
            indicator: String = Constants.navigateIconName,
            horizontalSpacing: CGFloat = Constants.horizontalSpacing,
            verticalPadding: CGFloat = Constants.verticalPadding,
            horizontalPadding: CGFloat? = nil
        ) {
            self.icon = icon
            self.indicator = indicator
            self.horizontalSpacing = horizontalSpacing
            self.verticalPadding = verticalPadding
            self.horizontalPadding = horizontalPadding
        }
    }

    public enum NavigationTitleDisplayMode {
        case automatic
        case inline
        case large
    }
}

/// Convenience modifiers.
@available(iOS 13.0, *)
public extension SettingPage {
    func previewIcon(_ icon: String, color: Color = .blue) -> SettingPage {
        var page = self
        page.previewConfiguration.icon = .system(icon: icon, backgroundColor: color)
        return page
    }

    func previewIcon(_ icon: String, foregroundColor: Color = .white, backgroundColor: Color = .blue) -> SettingPage {
        var page = self
        page.previewConfiguration.icon = .system(
            icon: icon,
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor
        )
        return page
    }

    func previewIcon(icon: SettingIcon) -> SettingPage {
        var page = self
        page.previewConfiguration.icon = icon
        return page
    }

    func previewIndicator(_ indicator: String) -> SettingPage {
        var page = self
        page.previewConfiguration.indicator = indicator
        return page
    }
}
