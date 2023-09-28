
//
//  SettingText.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

/**
 A simple text view.
 */
public struct SettingText: View, AirSetting {
    public let id: AnyHashable?
    public let title: String
    public let foregroundColor: Color?
    public let horizontalSpacing: CGFloat
    public let verticalPadding: CGFloat
    public let horizontalPadding: CGFloat?

    public init(
        id: AnyHashable? = nil,
        title: String,
        foregroundColor: Color? = nil,
        horizontalSpacing: CGFloat = Constants.horizontalSpacing,
        verticalPadding: CGFloat = Constants.verticalPadding,
        horizontalPadding: CGFloat? = nil
    ) {
        self.id = id
        self.title = title
        self.foregroundColor = foregroundColor
        self.horizontalSpacing = horizontalSpacing
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }

    public var body: some View {
        SettingTextView(
            title: title,
            foregroundColor: foregroundColor,
            horizontalSpacing: horizontalSpacing,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding
        )
    }
}
