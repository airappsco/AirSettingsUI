//
//  AirAppsOneView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//

import AirFonts
import SwiftUI

@available(iOS 15.0, *)
public struct AirAppsOneView: View {

    public init() {}

    public var body: some View {
        VStack {
            Spacer()

            HStack {
                Text.style(.largeTitle, weight: .bold, content: Strings.airApps)
                Text.style(.largeTitle, weight: .bold, content: Strings.one)
                    .foregroundColor(.accentColor)
            }

            Spacer()

            Button {
                do {
                    try AirSettingsUIDependency.shared.openAirAppsOne()
                } catch {
                    debugPrint(error.localizedDescription)
                }
            } label: {
                Text.style(.callout, weight: .bold, content: Strings.joinUs)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .frame(idealWidth: 202, maxWidth: 202, idealHeight: 40, maxHeight: 40)
            .buttonStyle(.borderedProminent)
            .cornerRadius(20)
        }
        .frame(idealHeight: 156, maxHeight: 156)
        .padding(17)
        .frame(maxWidth: .infinity)
    }
}

@available(iOS 15.0, *)
struct AirAppsOneView_Previews: PreviewProvider {
    static var previews: some View {
        AirAppsOneView()
    }
}
