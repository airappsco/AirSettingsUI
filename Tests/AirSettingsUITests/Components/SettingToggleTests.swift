//
//  SettingToggleTests.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
@testable import AirSettingsUI
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
final class SettingToggleTests: XCTestCase {

    private var sut: SettingToggle!

    override func setUp() {
        super.setUp()
        sut = .init(title: "Just a simpel title", isOn: .constant(false))
    }

    override func tearDown() {
        sut = .none
        super.tearDown()
    }

    func test_settingToggle_false() {
        assert(view: sut)
    }

    func test_settingToggle_true() {
        sut = .init(title: "Now it's true", isOn: .constant(true))
        assert(view: sut)
    }
}
