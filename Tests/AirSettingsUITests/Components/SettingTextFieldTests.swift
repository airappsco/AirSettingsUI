//
//  SettingTextFieldTests.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
@testable import AirSettingsUI
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
@available(iOS 13.0, *)
final class SettingTextFieldTests: XCTestCase {

    private var sut: SettingTextField!

    override func setUp() {
        super.setUp()
        sut = .init(placeholder: "Some placeholder", text: .constant(""))
    }

    override func tearDown() {
        sut = .none
        super.tearDown()
    }

    func test_settingTextField_emptyText() {
        assert(view: sut)
    }

    func test_settingTextField_withText() {
        sut = .init(placeholder: "Some placeholder", text: .constant("But it does some text"))
        assert(view: sut)
    }
}
