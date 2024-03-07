//
//  SocialMedia.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//

public enum SocialMedia: Int, CaseIterable {
    case facebook = 0, instagram, twitter, linkedIn
}

extension SocialMedia {
    var imageName: String {
        switch self {
        case .facebook:
            return "icon.facebook"
        case .instagram:
            return "icon.instagram"
        case .twitter:
            return "icon.twitter"
        case .linkedIn:
            return "icon.linkedIn"
        }
    }
    
    var linkString: String {
        switch self {
        case .facebook:
            return "https://www.facebook.com/airappsco"
        case .instagram:
            return "https://www.instagram.com/airappsco"
        case .twitter:
            return "https://twitter.com/airappsco"
        case .linkedIn:
            return "https://www.linkedin.com/company/airapps"
        }
    }
}
