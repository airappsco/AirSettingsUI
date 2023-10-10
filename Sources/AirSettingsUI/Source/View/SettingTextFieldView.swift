//
//  SettingTextFieldView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

@available(iOS 13.0, *)
struct SettingTextFieldView: View {

    @Environment(\.edgePadding) private var edgePadding

    let placeholder: String
    @Binding var text: String
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat?

    init(
        placeholder: String,
        text: Binding<String>,
        verticalPadding: CGFloat = Constants.verticalPadding,
        horizontalPadding: CGFloat? = nil
    ) {
        self.placeholder = placeholder
        _text = text
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }

    var body: some View {
        TextField(placeholder, text: $text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding ?? edgePadding)
            .accessibilityElement(children: .combine)
    }
}
