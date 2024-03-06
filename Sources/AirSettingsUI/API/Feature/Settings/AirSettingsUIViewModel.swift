import Foundation
import SwiftUI

@available(iOS 15.0, *)
public final class AirSettingsUIViewModel: ObservableObject {
    
    var isSubscriber: Bool {
       // TODO: Air.shared.isSubscriber()
        return true
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
        // TODO:  AirTermsAndPrivacyManager.showTermsAndPrivacy(target: viewController)
    }
    
    func openAirAppsOne() {
       // TODO: Air.shared.displaySettingsPW { _ in }
    }
}
