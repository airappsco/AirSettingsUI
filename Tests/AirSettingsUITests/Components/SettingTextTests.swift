
//
//  SettingTextTests.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
@testable import AirSettingsUI
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
final class SettingTextTests: XCTestCase {

    private var sut: SettingText!

    override func setUp() {
        super.setUp()
        sut = .init(title: "Just some text")
    }

    override func tearDown() {
        sut = .none
        super.tearDown()
    }

    func test_settingText() {
        assert(view: sut)
    }
}
