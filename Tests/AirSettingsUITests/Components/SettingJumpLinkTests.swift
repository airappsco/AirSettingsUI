@testable import AirSettingsUI
import XCTest

final class SettingJumpLinkTests: XCTestCase {
    
    private var sut: SettingJumpLink!
    
    override func tearDown() {
        sut = .none
        super.tearDown()
    }
    
    func test_settingJumpLink_whenSingleItem() {
        let settingViewModel = SettingViewModel()
        settingViewModel.searchText = "to"
        sut = .init(path:
                .init(settings: [
                    SettingText(title: "Some Text to be found")
                ])
        )
        assert(
            view: sut.environmentObject(settingViewModel)
        )
    }
    
    func test_settingJumpLink_multipleItem() {
        let settingViewModel = SettingViewModel()
        settingViewModel.highlightMatchingText = true
        settingViewModel.searchText = "Item"
        sut = .init(path:
                .init(settings: [
                    SettingText(title: "Don't fine me PLEASE"),
                    SettingText(title: "Item 1"),
                    SettingText(title: "Item 2")
                ])
        )
        assert(
            view: sut.environmentObject(settingViewModel)
        )
    }
    
    func test_settingJumpLink_multipleItemAndNavigation() {
        let settingViewModel = SettingViewModel()
        settingViewModel.highlightMatchingText = true
        settingViewModel.searchText = "Item"
        sut = .init(path:
                .init(settings: [
                    SettingText(title: "Don't fine me PLEASE"),
                    SettingText(title: "Item 1"),
                    SettingText(title: "Item 2"),
                    SettingPage(title: "Next Page", tuple: {
                        SettingTupleView(settings: [
                            SettingText(title: "The next page :)")
                        ])
                    })
                ])
        )
        assert(
            view: sut.environmentObject(settingViewModel)
        )
    }
}
