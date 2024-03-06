//
//  AirSettingsUI.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import AirFonts
import SwiftUI

// swiftlint:disable class_delegate_protocol

@available(iOS 15.0, *)
public protocol AirSettingsUIDelegate {
    /// Set the delegate of AirSettingsUIDependency for AUM calls
    func setup()
    /// Gets the user subsription status from AUM
    var isSubscriber: Bool { get }
    /// Showing terms and conditions from AUM
    func showTermsAndPrivacy(target: UIViewController)
    // Showing settings paywall from AUM
    func openAirAppsOne()
}


/// Default Settings View - applications are `not` required to use it
@available(iOS 15.0, *)
public struct AirSettingsUI: View {
    
    @StateObject private var viewModel: AirSettingsUIViewModel
    @SettingBuilder private let additionalOptions: SettingGroup?
    
    public init(viewModel: AirSettingsUIViewModel, additionalOptions: (() -> SettingGroup)? = .none) {
        _viewModel = .init(wrappedValue: viewModel)
        self.additionalOptions = additionalOptions?()
    }
    
    public var body: some View {
        SettingStack {
            SettingPage(title: Strings.settings) {
                if !viewModel.isSubscriber {
                    SettingGroup(id: "Air Apps One View") {
                        SettingCustomContent {
                            AirAppsOneView()
                        }
                    }
                }
                
                SettingGroup(id: "Air Account View") {
                    SettingCustomContent {
                        AirAccountView()
                    }
                }
                
                if let additionalOptions {
                    additionalOptions
                }
                
                SettingGroup {
                    SettingPage(title: Strings.appIcon) {
                        SettingCustomContent {
                            CustomIconSelectionView()
                        }
                    }
                    .previewIcon(
                        icon: .image(
                            Image(uiImage: AppIcon.currentSelectedPreview),
                            inset: 0,
                            foregroundColor: .none,
                            backgroundColor: .clear
                        )
                    )
                }
                SettingGroup {
                    SettingButton(title: Strings.shareApp, action: viewModel.share)
                        .icon(
                            icon: .image(
                                .init(
                                    systemName: "square.and.arrow.up.fill"),
                                inset: 5,
                                foregroundColor: .white,
                                backgroundColor: .accentColor
                            )
                        )
                    SettingButton(title: Strings.termsAndPrivacy, action: viewModel.openTermsAndPrivacy)
                        .icon(
                            icon: .image(
                                .init(
                                    systemName: "hand.raised.fill"),
                                inset: 5,
                                foregroundColor: .white,
                                backgroundColor: .accentColor
                            )
                        )
                    SettingButton(title: "Air Apps One", action: viewModel.openAirAppsOne)
                    .icon(
                        icon: .image(
                            Image("logo.airapps.one", bundle: .module),
                            inset: 0,
                            foregroundColor: .none,
                            backgroundColor: .clear
                        )
                    )
                }
                
                SettingGroup(id: "Show case view") {
                    SettingCustomContent {
                        AppsShowcaseView()
                    }
                }
                
                SettingCustomContent(id: "Social Media") {
                    SocialMediaView().frame(maxWidth: .infinity)
                }
                
                SettingCustomContent(id: "Current Version") {
                    if let currentVersion = viewModel.currentVersion {
                        Text.style(.caption1, weight: .regular, content: currentVersion)
                            .frame(maxWidth: .infinity)
                    }
                }
                
                SettingCustomContent(id: "Logo Air Apps") {
                    Image("logo.airapps", bundle: .module)
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

@available(iOS 16.0, *)
struct AirSettings_Previews: PreviewProvider {
    static var previews: some View {
        AirSettingsUI(viewModel: .init(
            airSettingsDependency: .init(
                shareAppURL: URL(filePath: "Some Path")
            )
        )
        ) {
            SettingGroup {
                SettingTextField(placeholder: "Enter Name", text: .constant(""))
            }
        }
    }
}
// swiftlint:enable class_delegate_protocol