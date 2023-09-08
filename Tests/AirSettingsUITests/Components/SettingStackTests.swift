@testable import AirSettingsUI
import XCTest

final class SettingStackTests: XCTestCase {
    
    private var sut: SettingStack!
    
    override func setUp() {
        super.setUp()
        sut = .init(page: {
            .init(title: "Page title") {
                SettingButton(title: "Just a suspicous button", action: {})
            }
        })
    }
    
    override func tearDown() {
        sut = .none
        super.tearDown()
    }
    
    func test_settingStackTests() {
        assert(view: sut, size: .init(width: 300, height: 400))
    }
}
