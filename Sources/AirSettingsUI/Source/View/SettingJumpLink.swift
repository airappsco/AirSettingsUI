import SwiftUI

/**
 A link to show in the search results, for jumping to specific page.
 */
struct SettingJumpLink: View {
    @Environment(\.settingSecondaryColor) private var settingSecondaryColor
    @Environment(\.edgePadding) private var edgePadding
    
    let path: SettingPath
    let indicator: String
    let verticalSpacing: CGFloat
    let horizontalSpacing: CGFloat
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat?
    
    @EnvironmentObject private var settingViewModel: SettingViewModel
    @State private var isActive = false
    
    init(
        path: SettingPath,
        indicator: String = Constants.navigateIconName,
        verticalSpacing: CGFloat = 6,
        horizontalSpacing: CGFloat = Constants.horizontalSpacing,
        verticalPadding: CGFloat = Constants.verticalPadding,
        horizontalPadding: CGFloat? = nil
    ) {
        self.path = path
        self.indicator = indicator
        self.verticalSpacing = verticalSpacing
        self.horizontalSpacing = horizontalSpacing
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }
    
    var body: some View {
        let destinationPage = path.settings.last(where: { $0 is SettingPage })
        
        Button {
            isActive = true
        } label: {
            preview(destinationPage: destinationPage)
        }
        .buttonStyle(.row)
        .background {
            if let destinationPage {
                NavigationLink(isActive: $isActive) {
                    SettingView(setting: destinationPage, isPagePreview: false)
                } label: {
                    EmptyView()
                }
                .opacity(0)
            }
        }
    }
    
    @ViewBuilder func preview(destinationPage: AirSetting?) -> some View {
        let title = destinationTile()
        let titles = pathTiles()
        
        HStack(spacing: horizontalSpacing) {
            VStack(spacing: verticalSpacing) {
                if settingViewModel.highlightMatchingText {
                    let highlightedText = highlightSearchText(searchText: settingViewModel.searchText, in: title)
                    
                    Text(highlightedText)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    Text(title)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                /// only show titles if more than 1 (no need to say "General" underneath "General")
                if titles.count > 1 {
                    /// empty title
                    HStack(spacing: 2) {
                        ForEach(Array(zip(titles.indices, titles)), id: \.1.self) { index, title in
                            Text(title)
                            
                            if index < titles.count - 1 {
                                Image(systemName: "arrow.right")
                            }
                        }
                    }
                    .font(.footnote)
                    .foregroundColor(settingSecondaryColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.vertical, verticalPadding)
            
            if destinationPage != nil {
                Image(systemName: indicator)
                    .foregroundColor(settingSecondaryColor)
            }
        }
        .padding(.horizontal, horizontalPadding ?? edgePadding)
        .accessibilityElement(children: .combine)
    }
    
    func pathTiles() -> [String] {
        let titles = path.settings.compactMap { $0.text }
        return titles
    }
    
    func destinationTile() -> String {
        if
            let setting = path.settings.last,
            let title = setting.text
        {
            return title
        }
        
        return ""
    }
    
    func highlightSearchText(searchText: String, in text: String) -> AttributedString {
        var attributedString = AttributedString(text)
        let ranges = text.ranges(of: searchText, options: [.caseInsensitive, .diacriticInsensitive])
        
        if ranges.isEmpty {
            attributedString.backgroundColor = .clear
        } else {
            attributedString.backgroundColor = .clear
            for range in ranges {
                if let attributedRange = range.attributedRange(for: attributedString) {
                    attributedString[attributedRange].backgroundColor = .accentColor.opacity(0.2)
                }
            }
        }
        
        return attributedString
    }
}
