@testable import AirSettingsUI
import SwiftUI
import XCTest

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
