//
//  SettingTupleView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

/**
 A `Setting` that can nest multiple sub-`Setting`s.
 */
public struct SettingTupleView: AirSetting {
    public let id: AnyHashable?
    public let settings: [AirSetting]

    public init(id: AnyHashable? = nil, settings: [AirSetting]) {
        self.id = id
        self.settings = settings
    }
}

@available(iOS 13.0, *)
public extension SettingTupleView {

    /// Flatten the tuple view and subgroups.
    var flattened: [AirSetting] {
        var flattened = [AirSetting]()

        for setting in settings {
            switch setting {
            case let group as SettingGroup:
                flattened += group.tuple.flattened
            case let tuple as SettingTupleView:
                flattened += tuple.flattened
            default:
                flattened.append(setting)
            }
        }

        return flattened
    }
}
