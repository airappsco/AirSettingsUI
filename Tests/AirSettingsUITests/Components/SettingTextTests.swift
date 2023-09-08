@testable import AirSettingsUI
import XCTest

final class SettingTextTests: XCTestCase {
    
    private var sut: SettingText!
    
    override func setUp() {
        super.setUp()
        sut = .init(title: "Just some text")
    }
    
    override func tearDown() {
        sut = .none
        super.tearDown()
    }
    
    func test_settingText() {
        assert(view: sut)
    }
}
