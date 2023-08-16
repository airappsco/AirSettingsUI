import SwiftUI

struct SettingSliderView: View {
    @Environment(\.edgePadding) private var edgePadding
    
    @Binding var value: Double
    let range: ClosedRange<Double>
    let step: Double.Stride
    let minimumImage: Image?
    let maximumImage: Image?
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat?
    
    var body: some View {
        Slider(
            value: $value,
            in: range,
            step: step
        ) {
            EmptyView()
        } minimumValueLabel: {
            if let minimumImage {
                minimumImage
            }
        } maximumValueLabel: {
            if let maximumImage {
                maximumImage
            }
        }
        .accessibilityElement(children: .combine)
        .padding(.vertical, verticalPadding)
        .padding(.horizontal, horizontalPadding ?? edgePadding)
    }
}