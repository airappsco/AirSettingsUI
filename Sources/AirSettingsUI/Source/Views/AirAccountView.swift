//
//  AirAccountView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
public struct AirAccountView: View {

    public init() {}

    @State private var isPresentingSignIn = false
    
    public var body: some View {
        Button {
            isPresentingSignIn = true
        } label: {
            content
                .opacity(!isPresentingSignIn ? 1 : 0)
        }
        .background(
            VStack {
                if isPresentingSignIn {
                    EmptyView()
                }
            }
        )
        .overlay {
            if isPresentingSignIn {
                ProgressView()
            }
        }
    }
    
    private var content: some View {
        HStack {
            Image("icon.profile.logged.out", bundle: .module)
                .resizable()
                .frame(width: 55, height: 55)
                .cornerRadius(27.5)

            VStack(alignment: .leading, spacing: 4) {
                Text(
                    Strings.signInToAirAppsCloud
                )
                .airFont(style: .subhead, weight: .bold)
                .foregroundColor(.primary)
                Text(
                    Strings.signInOrCreateAccount
                )
                .foregroundColor(.primary)
                .airFont(style: .footnote, weight: .regular)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

@available(iOS 15.0, *)
struct AirAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AirAccountView()
    }
}
