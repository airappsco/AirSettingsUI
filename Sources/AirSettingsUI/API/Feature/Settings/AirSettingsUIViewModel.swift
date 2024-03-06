//
//  AirSettingsUIViewModel.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import Foundation
import SwiftUI

@available(iOS 15.0, *)
public final class AirSettingsUIViewModel: ObservableObject {
    
    var isSubscriber: Bool {
        do {
            return try AirSettingsUIDependency.shared.isSubscriber()
        } catch {
           debugPrint("⚠️ AUM delegate produced an error:", error.localizedDescription)
           return false
        }
    }

    var currentIconName: String {
        application.alternateIconName ?? "AppIcon0"
    }
    var currentVersion: String? {
        guard let version: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return .none }
        return "V-\(version)"
    }
    
    private let application: UIApplication
    private let airSettingsDependency: AirSettingsUIDependency
     
    public init(uiApplication: UIApplication = .shared, airSettingsDependency: AirSettingsUIDependency) {
        application = uiApplication
        self.airSettingsDependency = airSettingsDependency
    }
    
    func share() {
        let activityVC = UIActivityViewController(activityItems: [airSettingsDependency.shareAppURL], applicationActivities: nil)
        application.keyWindowPresentedController?.present(activityVC, animated: true, completion: nil)
    }
    
    func openTermsAndPrivacy() {
        guard let viewController = UIApplication.shared.keyWindowPresentedController else { return }
        do {
            try AirSettingsUIDependency.shared.showTermsAndPrivacy(target: viewController)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func openAirAppsOne() {
        do {
            try AirSettingsUIDependency.shared.openAirAppsOne()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
