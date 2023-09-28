
//
//  SettingPickerView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

struct SettingPickerView: View {
    @Environment(\.edgePadding) private var edgePadding
    @Environment(\.settingSecondaryColor) private var settingSecondaryColor

    let icon: SettingIcon?
    let title: String
    let choices: [String]
    @Binding var selectedIndex: Int
    let foregroundColor: Color?
    let horizontalSpacing: CGFloat
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat?
    let choicesConfiguration: SettingPicker.ChoicesConfiguration

    @State private var isActive = false

    var body: some View {
        switch choicesConfiguration.pickerDisplayMode {
        case .navigation:
            Button {
                isActive = true
            } label: {
                HStack(spacing: horizontalSpacing) {
                    if let icon {
                        SettingIconView(icon: icon)
                    }

                    Text(title)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, verticalPadding)

                    if choices.indices.contains(selectedIndex) {
                        let selectedChoice = choices[selectedIndex]

                        Text(selectedChoice)
                            .foregroundColor(foregroundColor ?? settingSecondaryColor)
                    }

                    Image(systemName: Constants.navigateIconName)
                        .foregroundColor(foregroundColor ?? settingSecondaryColor)
                }
                .padding(.horizontal, horizontalPadding ?? edgePadding)
                .accessibilityElement(children: .combine)
            }
            .buttonStyle(.row)
            .background {
                NavigationLink(isActive: $isActive) {
                    SettingPickerChoicesView(
                        title: title,
                        choices: choices,
                        selectedIndex: $selectedIndex,
                        choicesConfiguration: choicesConfiguration
                    )
                } label: {
                    EmptyView()
                }
                .opacity(0)
            }

        case .menu:
            HStack(spacing: horizontalSpacing) {
                Text(title)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, verticalPadding)

                Picker("", selection: $selectedIndex) {
                    ForEach(Array(zip(choices.indices, choices)), id: \.1) { index, choice in
                        Text(choice).tag(index)
                    }
                }
                .pickerStyle(.menu)
#if os(iOS)
                .padding(.trailing, -edgePadding + 2)
#else
                .padding(.trailing, -2)
#endif
                .tint(foregroundColor ?? settingSecondaryColor)
            }
            .padding(.horizontal, horizontalPadding ?? edgePadding)
            .accessibilityElement(children: .combine)
        case .inline:
            ForEach(Array(zip(choices.indices, choices)), id: \.1) { index, choice in
                Button {
                    selectedIndex = index
                } label: {
                    HStack {
                        Text(choice)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, choicesConfiguration.verticalPadding)

                        if index == selectedIndex {
                            Image(systemName: "checkmark")
                                .foregroundColor(.accentColor)
                        }
                    }
                    .padding(.horizontal, choicesConfiguration.horizontalPadding)
                }
                .buttonStyle(.row)
            }
        }
    }
}

struct SettingPickerChoicesView: View {
    let title: String
    let choices: [String]
    @Binding var selectedIndex: Int
    let choicesConfiguration: SettingPicker.ChoicesConfiguration

    var body: some View {
        SettingPageView(title: title, navigationTitleDisplayMode: choicesConfiguration.pageNavigationTitleDisplayMode) {
            SettingGroupView(
                header: choicesConfiguration.groupHeader,
                footer: choicesConfiguration.groupFooter,
                horizontalPadding: choicesConfiguration.groupHorizontalPadding,
                backgroundColor: choicesConfiguration.groupBackgroundColor,
                backgroundCornerRadius: choicesConfiguration.groupBackgroundCornerRadius,
                dividerLeadingMargin: choicesConfiguration.groupDividerLeadingMargin,
                dividerTrailingMargin: choicesConfiguration.groupDividerTrailingMargin,
                dividerColor: choicesConfiguration.groupDividerColor
            ) {
                ForEach(Array(zip(choices.indices, choices)), id: \.1) { index, choice in
                    Button {
                        selectedIndex = index
                    } label: {
                        HStack {
                            Text(choice)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, choicesConfiguration.verticalPadding)

                            if index == selectedIndex {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .padding(.horizontal, choicesConfiguration.horizontalPadding)
                    }
                    .buttonStyle(.row)
                }
            }
        }
    }
}
