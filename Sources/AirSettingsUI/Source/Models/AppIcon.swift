//
//  AppIcon.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//

import SwiftUI

enum AppIcon: String, CaseIterable, Identifiable {

    case `default` = "AppIcon0"
    case option1 = "AppIcon1"
    case option2 = "AppIcon2"
    case option3 = "AppIcon3"
    case option4 = "AppIcon4"
    case option5 = "AppIcon5"
    case option6 = "AppIcon6"
    case option7 = "AppIcon7"
    case option8 = "AppIcon8"
    case option9 = "AppIcon9"
    case option10 = "AppIcon10"
    case option11 = "AppIcon11"
    case option12 = "AppIcon12"
    case option13 = "AppIcon13"
    case option14 = "AppIcon14"
    case option15 = "AppIcon15"
    case option16 = "AppIcon16"
    case option17 = "AppIcon17"
    case option18 = "AppIcon18"
    case option19 = "AppIcon19"
    case option20 = "AppIcon20"
    case option21 = "AppIcon21"
    case option22 = "AppIcon22"
    case option23 = "AppIcon23"
    
    var id: String { rawValue }
    
    var name: String? {
        if self == .default {
            return .none
        } else {
            return rawValue
        }
    }
}

extension AppIcon {
    
    static var currentSelectedPreview: UIImage {
        guard let appIcon = AppIcon(
            rawValue: UIApplication.shared.alternateIconName ?? ""
        ) else { return AppIcon.default.preview }
        return appIcon.preview
    }
    
    var preview: UIImage {
        UIImage(named: "\(rawValue)-Preview") ?? UIImage()
    }
}
