//
//  SettingsIcon.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

/**
 An general purpose icon view.
 */
@available(iOS 13.0, *)
public enum SettingIcon {

    case system(
        icon: String,
        foregroundColor: Color = .white,
        backgroundColor: Color
    )

    /// Pass in a `foregroundColor` to render and recolor the image as a template.
    case image(
        _ image: Image,
        inset: CGFloat,
        foregroundColor: Color?,
        backgroundColor: Color
    )

    case custom(view: AnyView)
}
