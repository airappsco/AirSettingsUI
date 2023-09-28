@testable import AirSettingsUI
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
final class SettingPickerTests: XCTestCase {

    private var sut: SettingPicker!

    override func setUp() {
        super.setUp()
        sut = .init(title: "Setting Picker", choices: ["1", "2", "3"], selectedIndex: .constant(0))
    }

    override func tearDown() {
        sut = .none
        super.tearDown()
    }

    func test_settingPicker() {
        assert(view: sut)
    }
}
