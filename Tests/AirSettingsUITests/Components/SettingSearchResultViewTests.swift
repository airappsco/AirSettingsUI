@testable import AirSettingsUI
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
final class SettingSearchResultViewTests: XCTestCase {

    private var sut: SettingSearchResultView!

    override func setUp() {
        super.setUp()
        sut = .init(searchResult: .init(sections: [
            .init(paths: [
                .init(settings: [
                    SettingButton(title: "The First Button", action: {})
                ])
            ]),
            .init(paths: [
                .init(settings: [
                    SettingToggle(title: "The Second Toggle", isOn: .constant(false))
                ])
            ]),
            .init(paths: [
                .init(settings: [
                    SettingPicker(title: "Crazy Picker", choices: ["Crazy Train", "Ozzy"], selectedIndex: .constant(1))
                ])
            ])
        ]))
    }

    override func tearDown() {
        sut = .none
        super.tearDown()
    }

    func test_settingsSearchResult() {
        assert(view: sut)
    }
}
