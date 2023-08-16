import SwiftUI

/**
 The result builder for constructing `Setting` views.
 */
@resultBuilder public enum SettingBuilder {
    public static func buildOptional(_ component: SettingTupleView?) -> SettingTupleView {
        if let component {
            return SettingTupleView(settings: [component])
        } else {
            return SettingTupleView(settings: [])
        }
    }
    
    public static func buildBlock(_ parts: AirSetting...) -> SettingTupleView {
        return SettingTupleView(settings: parts)
    }
    
    public static func buildEither(first component: AirSetting) -> SettingTupleView {
        return SettingTupleView(settings: [component])
    }
    
    public static func buildEither(second component: AirSetting) -> SettingTupleView {
        return SettingTupleView(settings: [component])
    }
    
    public static func buildArray(_ components: [AirSetting]) -> SettingTupleView {
        return SettingTupleView(settings: components)
    }
}
