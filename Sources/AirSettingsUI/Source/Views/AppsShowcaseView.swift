//
//  AppsShowcaseView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//

import AirFonts
import SwiftUI

@available(iOS 15.0, *)
public struct AppsShowcaseView: View {
    
    let apps: [App] = App.allCases

    public init() {}

    public var body: some View {
        VStack(alignment: .leading) {
            Text.style(.title2, weight: .bold, content: Strings.airApps)
                .padding(.leading, 20)
                .padding(.top)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(apps, id: \.self) { app in
                        Button {
                            if let url = URL(string: app.appStorePath) {
                                UIApplication.shared.open(url)
                            }
                        } label: {
                            Image(app.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                        }
                        .buttonStyle(.borderless)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.bottom)
    }
}

@available(iOS 15.0, *)
struct AppsShowcaseView_Previews: PreviewProvider {
    static var previews: some View {
        AppsShowcaseView()
    }
}
