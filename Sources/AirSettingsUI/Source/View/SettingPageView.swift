//
//  SettingPageView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

struct SettingPageView<Content>: View where Content: View {

    @Environment(\.settingBackgroundColor) private var settingBackgroundColor

    let title: String
    let spacing: CGFloat
    let verticalPadding: CGFloat
    let backgroundColor: Color?
    let navigationTitleDisplayMode: SettingPage.NavigationTitleDisplayMode
    let isInitialPage: Bool

    @ViewBuilder let content: Content

    init(
        title: String,
        spacing: CGFloat = 20,
        verticalPadding: CGFloat = 12,
        backgroundColor: Color? = nil,
        navigationTitleDisplayMode: SettingPage.NavigationTitleDisplayMode = .inline,
        isInitialPage: Bool = false,
        content: () -> Content
    ) {
        self.title = title
        self.spacing = spacing
        self.verticalPadding = verticalPadding
        self.backgroundColor = backgroundColor
        self.navigationTitleDisplayMode = navigationTitleDisplayMode
        self.isInitialPage = isInitialPage
        self.content = content()
    }

    var body: some View {
#if os(iOS)

        let navigationBarTitleDisplayMode: NavigationBarItem.TitleDisplayMode = {
            switch navigationTitleDisplayMode {
            case .automatic:
                if isInitialPage {
                    return .large
                } else {
                    return .inline
                }
            case .inline:
                return .inline
            case .large:
                return .large
            }
        }()

        main
            .navigationBarTitleDisplayMode(navigationBarTitleDisplayMode)
#else
        main
#endif
    }

    @ViewBuilder var main: some View {
        if #available(iOS 16.0, macOS 13.0, *) {
            ScrollView {
                VStack(alignment: .leading, spacing: spacing) {
                    content
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, verticalPadding)
            }
            .scrollDismissesKeyboard(.interactively)
            .background(backgroundColor ?? settingBackgroundColor)
            .navigationTitle(title)
        } else {
            ScrollView {
                VStack(alignment: .leading, spacing: spacing) {
                    content
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, verticalPadding)
            }
            .background(backgroundColor ?? settingBackgroundColor)
            .navigationTitle(title)
        }
    }
}

struct SettingPagePreviewView: View {
    @Environment(\.edgePadding) private var edgePadding
    @Environment(\.settingSecondaryColor) private var settingSecondaryColor

    let title: String
    let selectedChoice: String?
    let icon: SettingIcon?
    let indicator: String
    let horizontalSpacing: CGFloat
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat?

    init(
        title: String,
        selectedChoice: String? = nil,
        icon: SettingIcon? = nil,
        indicator: String = Constants.navigateIconName,
        iconForegroundColor: Color? = nil,
        horizontalSpacing: CGFloat = Constants.horizontalSpacing,
        verticalPadding: CGFloat = Constants.verticalPadding,
        horizontalPadding: CGFloat? = nil
    ) {
        self.title = title
        self.selectedChoice = selectedChoice
        self.icon = icon
        self.indicator = indicator
        self.horizontalSpacing = horizontalSpacing
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
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

            if let selectedChoice {
                Text(selectedChoice)
                    .foregroundColor(settingSecondaryColor)
            }

            Image(systemName: indicator)
                .foregroundColor(settingSecondaryColor)
        }
        .padding(.horizontal, horizontalPadding ?? edgePadding)
        .accessibilityElement(children: .combine)
    }
}

extension SettingPage {
    /// generate all possibile paths
    func generatePaths() -> [SettingPath] {
        var paths = [SettingPath]()

        for setting in tuple.flattened {
            let initialItemPath = SettingPath(settings: [setting])
            let recursivePaths = generateRecursivePaths(for: initialItemPath)
            paths += recursivePaths
        }

        return paths
    }

    /// `path` - a path of rows whose last element is the row to generate
    func generateRecursivePaths(for path: SettingPath) -> [SettingPath] {
        /// include the current setting as a path
        var paths = [path]

        /// get the last setting, possibly a page
        guard let lastItem = path.settings.last else { return [] }

        /// If the last setting is a page, travel through the page's subpages.
        if let page = lastItem as? SettingPage {
            for setting in page.tuple.flattened {
                /// If it's a subpage, generate paths for it.
                if let page = setting as? SettingPage {
                    let currentPath = SettingPath(settings: path.settings + [page])
                    let recursivePaths = generateRecursivePaths(for: currentPath)
                    paths += recursivePaths
                } else {
                    /// If not, add the setting as an endpoint.
                    let currentPath = SettingPath(settings: path.settings + [setting])
                    paths += [currentPath]
                }
            }
        }

        return paths
    }
}
