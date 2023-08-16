import SwiftUI

/**
 A path for the search results.
 */
public struct SettingPath: Identifiable {
    public let id = UUID()
    public var settings: [AirSetting]
    
    public init(settings: [AirSetting]) {
        self.settings = settings
    }
}
