@testable import AirSettingsUI
import XCTest

// swiftlint:disable implicitly_unwrapped_optional
final class SettingSliderTests: XCTestCase {

    private var sut: SettingSlider!

    override func tearDown() {
        sut = .none
        super.tearDown()
    }

    func test_settingSlider_whenInitial() {
        sut = .init(value: .constant(0), range: 0...2)
        assert(view: sut, size: .init(width: 300, height: 50))
    }

    func test_settingSlider_whenMiddle() {
        sut = .init(value: .constant(1), range: 0...2)
        assert(view: sut, size: .init(width: 300, height: 50))
    }

    func test_settingSlider_whenEnd() {
        sut = .init(value: .constant(2), range: 0...2)
        assert(view: sut, size: .init(width: 300, height: 50))
    }
}
