
//
//  XCTestCase+Snapshot.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import SnapshotTesting
import SwiftUI
import XCTest

extension XCTestCase {
    func assert<T: View>(
        view: T,
        size: CGSize? = .none,
        record recording: Bool = false,
        file: StaticString = #file,
        testName: String = #function,
        line: UInt = #line
    ) {
        let uikitView = view.asUIKitView
        assertSnapshot(
            matching: uikitView,
            as: .image(size: size ?? uikitView.intrinsicContentSize),
            record: recording,
            file: file,
            testName: testName,
            line: line
        )
    }
}
