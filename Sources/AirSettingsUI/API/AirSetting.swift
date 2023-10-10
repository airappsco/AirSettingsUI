//
//  AirSetting.swift
//  AirSettingUI
//
//  Created by iOS Developer on 8/15/23.
//  Copyright © 2023 AirApps. All rights reserved.
//

import SwiftUI
/**
 The base protocol for views shown in the `SettingBuilder`.
 */
public protocol AirSetting {
    var id: AnyHashable? { get }
}

@available(iOS 15.0, *)
public extension AirSetting {
    /**
     A unique identifier for the view.
     */
    var identifier: AnyHashable {
        if let id {
            return id
        }
        return textIdentifier
    }
    /**
     The identifier generated from the setting's title.
     */
    var textIdentifier: String? {
        switch self {
        case let text as SettingText:
            return text.title
        case let button as SettingButton:
            return button.title
        case let toggle as SettingToggle:
            return toggle.title
        case is SettingSlider:
            return nil
        case let picker as SettingPicker:
            return picker.title
        case let textField as SettingTextField:
            return textField.placeholder
        case let page as SettingPage:
            return page.title
        case let group as SettingGroup:
            return group.tuple.textIdentifier
        case let tuple as SettingTupleView:
            return tuple.flattened.compactMap { $0.textIdentifier }.joined()
        case let customView as SettingCustomContent:
            return customView.titleForSearch
        default:
            return nil
        }
    }

    /**
     Text for searching.
     */
    var text: String? {
        switch self {
        case let text as SettingText:
            return text.title
        case let button as SettingButton:
            return button.title
        case let toggle as SettingToggle:
            return toggle.title
        case is SettingSlider:
            return nil
        case let picker as SettingPicker:
            return picker.title
        case let textField as SettingTextField:
            return textField.placeholder
        case let page as SettingPage:
            return page.title
        case let group as SettingGroup:
            return group.header
        case is SettingTupleView:
            return nil
        case let customView as SettingCustomContent:
            return customView.titleForSearch
        default:
            return nil
        }
    }
}
