@testable import AirSettingsUI
import XCTest
import SwiftUI

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
