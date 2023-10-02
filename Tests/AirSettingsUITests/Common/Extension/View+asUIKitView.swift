//
//  View+asUIKitView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

extension View {
    var asUIKitView: UIView {
        UIHostingController(rootView: self).view
    }
}
