//
//  SettingSlider.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SwiftUI

/**
 A slider.
 */
public struct SettingSlider: View, AirSetting {
    public let id: AnyHashable?
    @Binding public var value: Double
    public let range: ClosedRange<Double>
    public let step: Double.Stride
    public let minimumImage: Image?
    public let maximumImage: Image?
    public let verticalPadding: CGFloat
    public let horizontalPadding: CGFloat?

    public init(
        id: AnyHashable? = nil,
        value: Binding<Double>,
        range: ClosedRange<Double>,
        step: Double.Stride = 0.1,
        minimumImage: Image? = nil,
        maximumImage: Image? = nil,
        verticalPadding: CGFloat = 8,
        horizontalPadding: CGFloat? = nil
    ) {
        self.id = id
        self._value = value
        self.range = range
        self.step = step
        self.minimumImage = minimumImage
        self.maximumImage = maximumImage
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }

    public var body: some View {
        SettingSliderView(
            value: $value,
            range: range,
            step: step,
            minimumImage: minimumImage,
            maximumImage: maximumImage,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding
        )
    }
}
