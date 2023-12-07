//
//  SettingIconView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI
/**
 A view for displaying a `SettingIcon`.
 */
struct SettingIconView: View {

    let icon: SettingIcon

    init(icon: SettingIcon) {
        self.icon = icon
    }

    var body: some View {
        switch icon {
        case .system(let icon, let foregroundColor, let backgroundColor):
            Image(systemName: icon)
                .foregroundColor(foregroundColor)
                .font(.footnote)
                .frame(width: Constants.iconDimension, height: Constants.iconDimension)
                .background(backgroundColor)
                .cornerRadius(Constants.iconCornerRadius)
        case .image(let image, let inset, let foregroundColor, let backgroundColor):
            if let foregroundColor {
                image
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(foregroundColor)
                    .aspectRatio(contentMode: .fit)
                    .padding(inset)
                    .frame(width: Constants.iconDimension, height: Constants.iconDimension)
                    .background(backgroundColor)
                .cornerRadius(Constants.iconCornerRadius)
            } else {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(inset)
                    .frame(width: Constants.iconDimension, height: Constants.iconDimension)
                    .background(backgroundColor)
                    .cornerRadius(Constants.iconCornerRadius)
            }

        case .custom(let anyView):
            anyView
        }
    }
}
