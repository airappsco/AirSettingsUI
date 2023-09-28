//
//  Range+AttributedRange.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import Foundation
extension Range<String.Index> {
    func attributedRange(for attributedString: AttributedString) -> Range<AttributedString.Index>? {
        let start = AttributedString.Index(lowerBound, within: attributedString)
        let end = AttributedString.Index(upperBound, within: attributedString)

        guard let start, let end else { return nil }
        let attributedRange = start ..< end
        return attributedRange
    }
}
