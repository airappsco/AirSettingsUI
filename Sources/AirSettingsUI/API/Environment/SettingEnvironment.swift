//
//  SettingEnvironment.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

@available(iOS 13.0, *)
private struct EdgePaddingKey: EnvironmentKey {
    static let defaultValue: CGFloat = 20
}

@available(iOS 13.0, *)
private struct PrimaryColorKey: EnvironmentKey {
    static let defaultValue = Color.primary
}

@available(iOS 13.0, *)
private struct SecondaryColorKey: EnvironmentKey {
    static let defaultValue = Color.secondary
}

@available(iOS 13.0, *)
private struct AccentColorKey: EnvironmentKey {
    static let defaultValue = Color.accentColor
}

@available(iOS 13.0, *)
private struct BackgroundColorKey: EnvironmentKey {
    static let defaultValue: Color = {
        if #available(iOS 15.0, *) {
#if os(iOS)
            return Color(uiColor: .systemGroupedBackground)
#else
            return Color(nsColor: .windowBackgroundColor)
#endif
        } else {
            return .white
        }
    }()
}

@available(iOS 13.0, *)
private struct SecondaryBackgroundColorKey: EnvironmentKey {
    static let defaultValue: Color = {
        if #available(iOS 15.0, *) {
#if os(iOS)
            return Color(uiColor: .secondarySystemGroupedBackground)
#else
            return Color(nsColor: .textBackgroundColor)
#endif
        } else {
            return .white
        }
    }()
}

@available(iOS 13.0, *)
public extension EnvironmentValues {
    /// Padding to line up with the navigation title.
    var edgePadding: CGFloat {
        get { self[EdgePaddingKey.self] }
        set { self[EdgePaddingKey.self] = newValue }
    }

    /// For text.
    var settingPrimaryColor: Color {
        get { self[PrimaryColorKey.self] }
        set { self[PrimaryColorKey.self] = newValue }
    }

    /// For secondary labels.
    var settingSecondaryColor: Color {
        get { self[SecondaryColorKey.self] }
        set { self[SecondaryColorKey.self] = newValue }
    }

    /// For buttons.
    var settingAccentColor: Color {
        get { self[AccentColorKey.self] }
        set { self[AccentColorKey.self] = newValue }
    }

    /// For outer views.
    var settingBackgroundColor: Color {
        get { self[BackgroundColorKey.self] }
        set { self[BackgroundColorKey.self] = newValue }
    }

    /// For inner views.
    var settingSecondaryBackgroundColor: Color {
        get { self[SecondaryBackgroundColorKey.self] }
        set { self[SecondaryBackgroundColorKey.self] = newValue }
    }
}
