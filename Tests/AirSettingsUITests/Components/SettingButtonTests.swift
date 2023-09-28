
//
//  SettingButtonTests.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
@testable import AirSettingsUI
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
final class SettingButtonTests: XCTestCase {

    private var sut: SettingButton!

    override func setUp() {
        super.setUp()
        sut = .init(title: "Setting Button", action: {})
    }

    override func tearDown() {
        sut = .none
        super.tearDown()
    }

    func test_settingButton() {
        assert(view: sut)
    }
}
