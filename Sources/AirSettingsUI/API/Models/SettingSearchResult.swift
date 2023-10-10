//
//  SettingSearchResult.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

@available(iOS 13.0, *)
public struct SettingSearchResult {
    public var sections: [Section]

    public struct Section: Identifiable {
        public let id = UUID()
        public let icon: SettingIcon?
        public let header: String?
        public var paths: [SettingPath]

        public init(icon: SettingIcon? = nil, header: String? = nil, paths: [SettingPath]) {
            self.icon = icon
            self.header = header
            self.paths = paths
        }
    }
}
