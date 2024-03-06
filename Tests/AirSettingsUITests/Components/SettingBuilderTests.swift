//
//  SettingBuilderTests.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
@testable import AirSettingsUI
import SwiftUI
import XCTest

@available(iOS 15.0, *)
final class SettingBuilderTests: XCTestCase {

    func testSettingBuilderWithSingleSetting() {
        let settingView = SettingTupleView(settings: [
            SettingText(title: "Single Setting")
        ])

        XCTAssertEqual(settingView.settings.count, 1)
    }

    func testSettingBuilderWithMultipleSettings() {
        let settingView = SettingTupleView(settings: [
            SettingText(title: "Setting 1"),
            SettingText(title: "Setting 2"),
            SettingText(title: "Setting 3")
        ])

        XCTAssertEqual(settingView.settings.count, 3)
    }

    func testSettingBuilderWithOptionalSetting() {
        let settingView: SettingTupleView? = nil

        XCTAssertNil(settingView)
    }

    func testSettingBuilderWithSingleOptionalSetting() {
        let settingView: SettingTupleView? = SettingTupleView(settings: [
            SettingText(title: "Optional Setting")
        ])

        XCTAssertEqual(settingView?.settings.count, 1)
    }

    func testSettingBuilderWithNestedSettings() {
        let nestedSettingView = SettingTupleView(settings: [
            SettingText(title: "Nested Setting 1"),
            SettingText(title: "Nested Setting 2")
        ])

        let settingView = SettingTupleView(settings: [
            SettingText(title: "Nested Setting 1"),
            nestedSettingView
        ])

        XCTAssertEqual(settingView.settings.count, 2)
    }
}
