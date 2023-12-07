//
//  SettingTextView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

struct SettingTextView: View {

    @Environment(\.edgePadding) private var edgePadding
    @Environment(\.settingPrimaryColor) private var settingPrimaryColor

    let title: String
    let foregroundColor: Color?
    let horizontalSpacing: CGFloat
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat?

    init(
        title: String,
        foregroundColor: Color? = nil,
        horizontalSpacing: CGFloat = Constants.horizontalSpacing,
        verticalPadding: CGFloat = Constants.verticalPadding,
        horizontalPadding: CGFloat?
    ) {
        self.title = title
        self.foregroundColor = foregroundColor
        self.horizontalSpacing = horizontalSpacing
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }

    var body: some View {
        Text(title)
            .foregroundColor(foregroundColor ?? settingPrimaryColor)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding ?? edgePadding)
    }
}
