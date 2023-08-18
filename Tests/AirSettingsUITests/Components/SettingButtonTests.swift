@testable import AirSettingsUI
import XCTest

final class SettingButtonTests: XCTestCase {
    
    private var sut: SettingButton!
    
    override func setUp() {
        super.setUp()
        sut = .init(title: "Setting Button", action: {})
    }
    
    override func tearDown() {
        sut = .none
        super.tearDown()
    }
    
    func test_settingButton() {
        assert(view: sut)
    }
}
