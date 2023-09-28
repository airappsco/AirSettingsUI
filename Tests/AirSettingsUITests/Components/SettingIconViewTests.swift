
//
//  SettingIconViewTests.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
@testable import AirSettingsUI
import SwiftUI
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
final class SettingIconViewTests: XCTestCase {

    private var sut: SettingIconView!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        sut = .none
        super.tearDown()
    }

    func test_settingIconView_whenCustomView() {
        let customView = AnyView(
            Image(Images.translateNowIconName, bundle: .module)
        )
        sut = .init(icon: .custom(view: customView))
        assert(view: sut)
    }

    func test_settingIconView_whenImage() {
        sut = .init(
            icon: .image(
                Image(Images.translateNowIconName, bundle: .module),
                inset: 0,
                foregroundColor: .none,
                backgroundColor: .clear
            )
        )
        assert(view: sut)
    }
}
