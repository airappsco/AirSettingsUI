//
//  SettingCustomContentTests.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import AirSettingsUI
import SwiftUI
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
final class SettingCustomContentTests: XCTestCase {

    private var sut: SettingCustomContent!

    override func setUp() {
        super.setUp()
        sut = .init(view: {
            Text("Some custom text")
            Button("Some custom Button") {}
        })
    }

    override func tearDown() {
        sut = .none
        super.tearDown()
    }

    func test_settingCustomContent() {
        assert(view: sut.view)
    }
}
