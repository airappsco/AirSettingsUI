//
//  SocialMediaView.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
public struct SocialMediaView: View {
    let socialMediaSupported: [SocialMedia]

    public init(socialMediaSupported: [SocialMedia] = SocialMedia.allCases) {
        self.socialMediaSupported = socialMediaSupported
    }
    
    public var body: some View {
        HStack {
            ForEach(socialMediaSupported, id: \.rawValue) { socialMedia in
                Button {
                    if let url = URL(string: socialMedia.linkString) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    Image(socialMedia.imageName, bundle: .module)
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .buttonStyle(.borderless)
            }
        }
    }
}

@available(iOS 15.0, *)
struct SocialMediaView_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaView()
    }
}
