import SwiftUI

struct SettingSearchResultView: View {
    @Environment(\.settingBackgroundColor) var settingBackgroundColor
    
    let searchResult: SettingSearchResult
    let spacing: CGFloat
    let verticalPadding: CGFloat
    let backgroundColor: Color?
    
    init(
        searchResult: SettingSearchResult,
        spacing: CGFloat = 20,
        verticalPadding: CGFloat = 6,
        backgroundColor: Color? = nil
    ) {
        self.searchResult = searchResult
        self.spacing = spacing
        self.verticalPadding = verticalPadding
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: spacing) {
                ForEach(searchResult.sections) { section in
                    content(section: section)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, verticalPadding)
        }
        .background(backgroundColor ?? settingBackgroundColor)
    }
    
    @ViewBuilder func content(section: SettingSearchResult.Section) -> some View {
        /// If it's just a custom view on the first page, show the custom view as-is.
        if
            section.header == nil,
            let firstPath = section.paths.first,
            let firstItem = firstPath.settings.first,
            let setting = firstItem as? SettingCustomContent,
            setting.displayIndependentlyInSearch
        {
            SettingView(setting: firstItem)
        } else {
            VStack {
                SettingGroupView(
                    icon: section.icon,
                    header: section.header
                ) {
                    ForEach(section.paths) { path in
                        /// If it's only 1 setting, the setting is on the main page - so just show it.
                        if path.settings.count == 1 {
                            if let setting = path.settings.first {
                                SettingView(setting: setting)
                            }
                        } else {
                            SettingJumpLink(path: path)
                        }
                    }
                }
            }
        }
    }
}
