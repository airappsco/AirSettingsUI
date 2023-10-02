//
//  SettingPicker.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

/**
 A multi-choice picker.
 */
public struct SettingPicker: View, AirSetting {
    public let id: AnyHashable?
    public let icon: SettingIcon?
    public let title: String
    public let choices: [String]
    @Binding public var selectedIndex: Int
    public let foregroundColor: Color?
    public let horizontalSpacing: CGFloat
    public let verticalPadding: CGFloat
    public let horizontalPadding: CGFloat?
    public var choicesConfiguration: ChoicesConfiguration

    public init(
        id: AnyHashable? = nil,
        icon: SettingIcon? = nil,
        title: String,
        choices: [String],
        selectedIndex: Binding<Int>,
        foregroundColor: Color? = nil,
        horizontalSpacing: CGFloat = Constants.horizontalSpacing,
        verticalPadding: CGFloat = Constants.verticalPadding,
        horizontalPadding: CGFloat? = nil,
        choicesConfiguration: ChoicesConfiguration = ChoicesConfiguration()
    ) {
        self.id = id
        self.icon = icon
        self.title = title
        self.choices = choices
        self._selectedIndex = selectedIndex
        self.foregroundColor = foregroundColor
        self.horizontalSpacing = horizontalSpacing
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.choicesConfiguration = choicesConfiguration
    }

    public enum DisplayMode {
        case navigation
        case menu
        case inline
    }

    public struct ChoicesConfiguration {
        public let verticalPadding: CGFloat
        public let horizontalPadding: CGFloat?
        public let pageNavigationTitleDisplayMode: SettingPage.NavigationTitleDisplayMode
        public var pickerDisplayMode: DisplayMode
        public let groupHeader: String?
        public let groupFooter: String?
        public let groupHorizontalPadding: CGFloat?
        public let groupBackgroundColor: Color?
        public let groupBackgroundCornerRadius: CGFloat
        public let groupDividerLeadingMargin: CGFloat
        public let groupDividerTrailingMargin: CGFloat
        public let groupDividerColor: Color?

        public init(
            verticalPadding: CGFloat = Constants.verticalPadding,
            horizontalPadding: CGFloat? = nil,
            pageNavigationTitleDisplayMode: SettingPage.NavigationTitleDisplayMode = .inline,
            pickerDisplayMode: DisplayMode = .navigation,
            groupHeader: String? = nil,
            groupFooter: String? = nil,
            groupHorizontalPadding: CGFloat? = nil,
            groupBackgroundColor: Color? = nil,
            groupBackgroundCornerRadius: CGFloat = Constants.groupBackgroundCornerRadius,
            groupDividerLeadingMargin: CGFloat = Constants.groupDividerLeadingMargin,
            groupDividerTrailingMargin: CGFloat = Constants.groupDividerTrailingMargin,
            groupDividerColor: Color? = nil
        ) {
            self.verticalPadding = verticalPadding
            self.horizontalPadding = horizontalPadding
            self.pageNavigationTitleDisplayMode = pageNavigationTitleDisplayMode
            self.pickerDisplayMode = pickerDisplayMode
            self.groupHeader = groupHeader
            self.groupFooter = groupFooter
            self.groupHorizontalPadding = groupHorizontalPadding
            self.groupBackgroundColor = groupBackgroundColor
            self.groupBackgroundCornerRadius = groupBackgroundCornerRadius
            self.groupDividerLeadingMargin = groupDividerLeadingMargin
            self.groupDividerTrailingMargin = groupDividerTrailingMargin
            self.groupDividerColor = groupDividerColor
        }
    }

    public var body: some View {
        SettingPickerView(
            icon: icon,
            title: title,
            choices: choices,
            selectedIndex: $selectedIndex,
            foregroundColor: foregroundColor,
            horizontalSpacing: horizontalSpacing,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding,
            choicesConfiguration: choicesConfiguration
        )
    }
}

/// Convenience modifiers.
public extension SettingPicker {
    func pickerDisplayMode(_ pickerDisplayMode: DisplayMode) -> SettingPicker {
        var picker = self
        picker.choicesConfiguration.pickerDisplayMode = pickerDisplayMode
        return picker
    }
}
