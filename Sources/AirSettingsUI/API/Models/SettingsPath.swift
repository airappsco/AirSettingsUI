//
//  SettingsPath.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

/**
 A path for the search results.
 */
public struct SettingPath: Identifiable {
    public let id = UUID()
    public var settings: [AirSetting]

    public init(settings: [AirSetting]) {
        self.settings = settings
    }
}
