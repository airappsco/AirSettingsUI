//
//  AirSettingsTests.swift
//  AirSettingUI
//
//  Created by iOS Developer on 8/15/23.
//  Copyright © 2023 AirApps. All rights reserved.
//

@testable import AirSettingsUI
import SwiftUI
import XCTest

@available(iOS 15.0, *)
final class AirSettingsTests: XCTestCase {
    func test_textIdentifier_whenSettingText() {
        XCTAssertEqual(SettingText(title: "Text").textIdentifier, "Text")
    }

    func test_textIdentifier_whenSettingButton() {
        XCTAssertEqual(SettingButton(title: "Button", action: {}).textIdentifier, "Button")
    }

    func test_textIdentifier_whenSettingToggle() {
        XCTAssertEqual(SettingToggle(title: "Toggle", isOn: .constant(false)).textIdentifier, "Toggle")
    }

    func test_textIdentifier_whenSettingSlider() {
        XCTAssertNil(SettingSlider(value: .constant(1), range: 0...3).textIdentifier)
    }

    func test_textIdentifier_whenSettingPicker() {
        XCTAssertEqual(SettingPicker(title: "Picker", choices: ["Picker 1", "Picker 2"], selectedIndex: .constant(0)).textIdentifier, "Picker")
    }

    func test_textIdentifier_whenSettingTextField() {
        XCTAssertEqual(SettingTextField(placeholder: "Placeholder", text: .constant("Some Text")).textIdentifier, "Placeholder")
    }

    func test_textIdentifier_whenSettingPage() {
        XCTAssertEqual(SettingPage(title: "Page", tuple: { SettingTupleView(settings: [SettingText(title: "Text")]) }).textIdentifier, "Page")
    }

    func test_textIdentifier_whenSettingGroup() {
        let settingGroup = SettingGroup(tuple: { SettingText(title: "Text") })
        XCTAssertEqual(settingGroup.textIdentifier, "Text")
    }

    func test_textIdentifier_whenSettingTupleView() {
        let settingTupleView = SettingTupleView(settings: [
            SettingText(title: "Text1"), SettingText(title: "Text2"), SettingText(title: "Text3")
        ])
        XCTAssertEqual(settingTupleView.textIdentifier, "Text1Text2Text3")
    }

    func test_textIdentifier_whenSettingCustomView() {
        XCTAssertNil(SettingCustomContent(view: { Text("CustomView") }).textIdentifier)
        XCTAssertNil(SettingCustomContent(view: {}).textIdentifier)
    }

    func test_textIdentifier_whenIDNil() {
        XCTAssertNil(AirSettingsBehaviorCheck().textIdentifier)
    }

    func test_id_whenIDNil() {
        XCTAssertNil(AirSettingsBehaviorCheck().id)
    }

    func test_id_whenCustomID() {
        var sut = AirSettingsBehaviorCheck()
        sut.id = "Some crazy reference"
        XCTAssertEqual(sut.id, "Some crazy reference")
    }

    func test_id_whenSettingText() {
        XCTAssertNil(SettingText(title: "Text").id)
    }

    func test_id_whenSettingButton() {
        XCTAssertNil(SettingButton(title: "Button", action: {}).id)
    }

    func test_id_whenSettingToggle() {
        XCTAssertNil(SettingToggle(title: "Toggle", isOn: .constant(false)).id)
    }

    func test_id_whenSettingSlider() {
        XCTAssertNil(SettingSlider(value: .constant(1), range: 0...3).id)
    }

    func test_id_whenSettingPicker() {
        XCTAssertNil(SettingPicker(title: "Picker", choices: ["Picker 1", "Picker 2"], selectedIndex: .constant(0)).id)
    }

    func test_id_whenSettingTextField() {
        XCTAssertNil(SettingTextField(placeholder: "Placeholder", text: .constant("Some Text")).id)
    }

    func test_id_whenSettingPage() {
        XCTAssertNil(SettingPage(title: "Page", tuple: { SettingTupleView(settings: [SettingText(title: "Text")]) }).id)
    }

    func test_id_whenSettingGroup() {
        let settingGroup = SettingGroup(tuple: { SettingText(title: "Text") })
        XCTAssertNil(settingGroup.id)
    }

    func test_id_whenSettingTupleView() {
        let settingTupleView = SettingTupleView(settings: [
            SettingText(title: "Text1"), SettingText(title: "Text2"), SettingText(title: "Text3")
        ])
        XCTAssertNil(settingTupleView.id)
    }

    func test_id_whenSettingCustomView() {
        XCTAssertNil(SettingCustomContent(view: { Text("CustomView") }).id)
        XCTAssertNil(SettingCustomContent(view: {}).id)
    }
}

@available(iOS 15.0, *)
extension AirSettingsTests {
    struct AirSettingsBehaviorCheck: AirSetting {
        var id: AnyHashable?
    }
}
