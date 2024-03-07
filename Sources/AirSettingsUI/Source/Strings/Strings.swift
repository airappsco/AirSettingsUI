//
//  Strings.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//

import Foundation

enum Strings {
    static let signInToAirAppsCloud = Strings.tr("Localizable", "signInToAirAppsCloud", fallback: "Sign in to Air Apps Cloud")
    static let signInOrCreateAccount = Strings.tr("Localizable", "signInOrCreateAccount", fallback: "Sign in or create an account")
    static let airApps = Strings.tr("Localizable", "airApps", fallback: "Air Apps")
    static let one = Strings.tr("Localizable", "one", fallback: "One")
    static let joinUs = Strings.tr("Localizable", "joinUs", fallback: "Join us")
    static let appIcon = Strings.tr("Localizable", "appIcon", fallback: "App Icon")
    static let done = Strings.tr("Localizable", "done", fallback: "Done")
    static let settings = Strings.tr("Localizable", "settings", fallback: "Settings")
    static let shareApp = Strings.tr("Localizable", "shareApp", fallback: "Share App")
    static let suggestNewIdea = Strings.tr("Localizable", "suggestNewIdea", fallback: "Suggest new idea")
    static let support = Strings.tr("Localizable", "support", fallback: "Support")
    static let termsAndPrivacy = Strings.tr("Localizable", "termsAndPrivacy", fallback: "Terms & Privacy")
}

extension Strings {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
        let format = Bundle.main.localizedString(forKey: key, value: value, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}
