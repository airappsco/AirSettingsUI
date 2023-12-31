//
//  SettingCustomContent.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

/**
 A custom view for use inside `SettingPage` or `SettingGroup`.

 Tip: Wrap any `Setting` (such as `SettingText` or `SettingToggle`) inside here to further customize them.

     SettingCustomContent {
         SettingText(title: "I'm bold!")
             .bold()
     }
 */
public struct SettingCustomContent: AirSetting {
    /**
     A unique ID for identifying this view.

     This is highly recommended to prevent duplicate rendering issues.
     */
    public let id: AnyHashable?

    /**
     A title for indexing in the search results.
     */
    public let titleForSearch: String?

    /**
     Set to `false` to keep a grouped background.
     */
    public let displayIndependentlyInSearch: Bool

    /**
     The view to display.
     */
    public var view: AnyView

    public init<Content>(
        id: AnyHashable? = nil,
        titleForSearch: String? = nil,
        displayIndependentlyInSearch: Bool = true,
        @ViewBuilder view: () -> Content
    ) where Content: View {
        self.id = id
        self.titleForSearch = titleForSearch
        self.displayIndependentlyInSearch = displayIndependentlyInSearch
        self.view = AnyView(view())
    }
}
