import SwiftUI

/// A vertical stack that adds separators.
/// From https://movingparts.io/variadic-views-in-swiftui
struct SettingDividedVStack<Content>: View where Content: View {

    let leadingMargin: CGFloat
    let trailingMargin: CGFloat
    let dividerColor: Color?
    @ViewBuilder let content: Content

    init(
        leadingMargin: CGFloat = 0,
        trailingMargin: CGFloat = 0,
        dividerColor: Color? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.leadingMargin = leadingMargin
        self.trailingMargin = trailingMargin
        self.dividerColor = dividerColor
        self.content = content()
    }

    var body: some View {
        _VariadicView.Tree(
            SettingDividedVStackLayout(
                leadingMargin: leadingMargin,
                trailingMargin: trailingMargin,
                dividerColor: dividerColor
            )
        ) {
            content
        }
    }
}

struct SettingDividedVStackLayout: _VariadicView_UnaryViewRoot {

    let leadingMargin: CGFloat
    let trailingMargin: CGFloat
    let dividerColor: Color?

    internal init(leadingMargin: CGFloat, trailingMargin: CGFloat, dividerColor: Color? = nil) {
        self.leadingMargin = leadingMargin
        self.trailingMargin = trailingMargin
        self.dividerColor = dividerColor
    }

    @ViewBuilder func body(children: _VariadicView.Children) -> some View {
        let last = children.last?.id

        VStack(spacing: 0) {
            ForEach(children) { child in
                child

                if child.id != last {
                    Divider()
                        .opacity(dividerColor == nil ? 1 : 0)
                        .overlay {
                            if let dividerColor {
                                dividerColor
                            }
                        }
                        .padding(.leading, leadingMargin)
                        .padding(.trailing, trailingMargin)
                }
            }
        }
    }
}
