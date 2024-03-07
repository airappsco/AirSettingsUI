//
//  SettingStackTests.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
@testable import AirSettingsUI
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
@available(iOS 15.0, *)
final class SettingStackTests: XCTestCase {

    private var sut: SettingStack!

    override func setUp() {
        super.setUp()
        sut = .init(page: {
            .init(title: "Page title") {
                SettingButton(title: "Just a suspicous button", action: {})
            }
        })
    }

    override func tearDown() {
        sut = .none
        super.tearDown()
    }

    func test_settingStackTests() {
        assert(view: sut, size: .init(width: 300, height: 400))
    }
}
