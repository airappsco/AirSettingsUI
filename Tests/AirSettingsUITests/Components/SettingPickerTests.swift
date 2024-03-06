//
//  SettingPickerTests.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
@testable import AirSettingsUI
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
@available(iOS 15.0, *)
final class SettingPickerTests: XCTestCase {

    private var sut: SettingPicker!

    override func setUp() {
        super.setUp()
        sut = .init(title: "Setting Picker", choices: ["1", "2", "3"], selectedIndex: .constant(0))
    }

    override func tearDown() {
        sut = .none
        super.tearDown()
    }

    func test_settingPicker() {
        assert(view: sut)
    }
}
