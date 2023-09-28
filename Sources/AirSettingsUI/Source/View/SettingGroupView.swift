
//
//  SettingGroupView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

struct SettingGroupView<Content: View>: View {

    @Environment(\.edgePadding) private var edgePadding
    @Environment(\.settingSecondaryBackgroundColor) private var settingSecondaryBackgroundColor
    @Environment(\.settingSecondaryColor) private var settingSecondaryColor

    let icon: SettingIcon?
    let header: String?
    let footer: String?
    let allowAttributedFooter: Bool
    let horizontalPadding: CGFloat?
    let foregroundColor: Color?
    let backgroundColor: Color?
    let backgroundCornerRadius: CGFloat
    let dividerLeadingMargin: CGFloat
    let dividerTrailingMargin: CGFloat
    let dividerColor: Color?

    @ViewBuilder public let content: () -> Content

    init(
        icon: SettingIcon? = nil,
        header: String? = nil,
        footer: String? = nil,
        allowAttributedFooter: Bool = true,
        horizontalPadding: CGFloat? = nil,
        foregroundColor: Color? = nil,
        backgroundColor: Color? = nil,
        backgroundCornerRadius: CGFloat = Constants.backgroundCornerRadius,
        dividerLeadingMargin: CGFloat = Constants.dividerLeadingMargin,
        dividerTrailingMargin: CGFloat = Constants.dividerTrailingMargin,
        dividerColor: Color? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.icon = icon
        self.header = header
        self.footer = footer
        self.allowAttributedFooter = allowAttributedFooter
        self.horizontalPadding = horizontalPadding
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.backgroundCornerRadius = backgroundCornerRadius
        self.dividerLeadingMargin = dividerLeadingMargin
        self.dividerTrailingMargin = dividerTrailingMargin
        self.dividerColor = dividerColor
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if icon != nil || header != nil {
                HStack(spacing: 2) {
                    if let icon {
                        SettingIconView(icon: icon)
                            .scaleEffect(0.6)
                    }

                    if let header {
                        Text(header)
                            .textCase(.uppercase)
                            .font(.system(.subheadline))
                            .foregroundColor(foregroundColor ?? settingSecondaryColor)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, backgroundCornerRadius)
                .padding(.bottom, 6)
            }

            SettingDividedVStack(
                leadingMargin: dividerLeadingMargin,
                trailingMargin: dividerTrailingMargin,
                dividerColor: dividerColor
            ) {
                content()
            }
            .background(backgroundColor ?? settingSecondaryBackgroundColor)
            .mask {
                RoundedRectangle(cornerRadius: backgroundCornerRadius, style: .continuous)
            }

            if let footer {
                VStack {
                    if allowAttributedFooter {
                        Text(.init(footer)) /// Support markdown.
                    } else {
                        Text(verbatim: footer)
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(.subheadline))
                .foregroundColor(foregroundColor ?? settingSecondaryColor)
                .padding(.horizontal, backgroundCornerRadius)
                .padding(.top, 8)
            }
        }
        .padding(.horizontal, horizontalPadding ?? edgePadding)
    }
}
