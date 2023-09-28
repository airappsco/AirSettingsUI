
//
//  SettingGroup.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

/**
 A group of `Setting`s.
 */
public struct SettingGroup: AirSetting {

    public let id: AnyHashable?
    let header: String?
    let footer: String?
    let allowAttributedFooter: Bool
    let horizontalPadding: CGFloat?
    let backgroundColor: Color?
    let backgroundCornerRadius: CGFloat
    let dividerLeadingMargin: CGFloat
    let dividerTrailingMargin: CGFloat
    let dividerColor: Color?

    @SettingBuilder let tuple: SettingTupleView

    public init(
        id: AnyHashable? = nil,
        header: String? = nil,
        footer: String? = nil,
        allowAttributedFooter: Bool = true,
        horizontalPadding: CGFloat? = nil,
        backgroundColor: Color? = nil,
        backgroundCornerRadius: CGFloat = Constants.backgroundCornerRadius,
        dividerLeadingMargin: CGFloat = Constants.dividerLeadingMargin,
        dividerTrailingMargin: CGFloat = Constants.dividerTrailingMargin,
        dividerColor: Color? = nil,
        @SettingBuilder tuple: () -> SettingTupleView
    ) {
        self.id = id
        self.header = header
        self.footer = footer
        self.allowAttributedFooter = allowAttributedFooter
        self.horizontalPadding = horizontalPadding
        self.backgroundColor = backgroundColor
        self.backgroundCornerRadius = backgroundCornerRadius
        self.dividerLeadingMargin = dividerLeadingMargin
        self.dividerTrailingMargin = dividerTrailingMargin
        self.dividerColor = dividerColor
        self.tuple = tuple()
    }
}
