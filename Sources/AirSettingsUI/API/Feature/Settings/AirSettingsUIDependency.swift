//
//  AirSettingsUIDependency.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import Foundation
import UIKit

/// `AirSettingsUIDependency` is a singleton class responsible for managing the dependencies needed by the AirSettings UI components.
/// This class allows for configuration of settings related to the AirSettings UI, including the application's share URL and delegation of specific UI events.
///
/// - Note: Ensure that the `setup` method is called before using the instance to properly configure the dependencies.
@available(iOS 15.0, *)
public class AirSettingsUIDependency {

    /// The shared instance of `AirSettingsUIDependency`.
    /// Use this singleton for accessing and configuring the UI dependencies throughout your application.
    public static let shared = AirSettingsUIDependency()

    /// The URL used for sharing the app. This can be set upon initialization or modified later.
    /// It's optional and can be nil if not required for sharing purposes.
    public var shareAppURL: URL?

    /// A flag indicating whether the `AirSettingsUIDependency` has been set up with a delegate.
    /// This property is private and used internally to ensure the `setup` method is only called once.
    private var isSetup = false

    /// The delegate responsible for handling AirSettings UI related events.
    /// This property is optional and can be set through the `setup` method.
    private var delegate: AirSettingsUIDelegate?

    /// Initializes a new instance of the `AirSettingsUIDependency` class.
    ///
    /// - Parameter shareAppURL: An optional URL for sharing the app. Defaults to nil.
    public init(
        shareAppURL: URL? = nil
    ) {
        self.shareAppURL = shareAppURL
    }

    /// Configures the `AirSettingsUIDependency` with a delegate to handle UI related events.
    /// This method can only be called once per instance as indicated by the `isSetup` flag.
    ///
    /// - Parameter shareAppURL: An optional URL for sharing the app. Defaults to nil.
    /// - Parameter delegate: The `AirSettingsUIDelegate` that will handle the UI related events.
    ///
    /// - Throws: `AirSettingsUIDependencyError.alreadySetup` if the `setup` method has already been called.
    public func setup(
        shareAppURL: URL? = nil,
        delegate: AirSettingsUIDelegate
    ) throws {
        guard !isSetup else {
            throw AirSettingsUIDependencyError.alreadySetup
        }
        self.shareAppURL = shareAppURL
        self.delegate = delegate
        isSetup = true
    }
}

@available(iOS 15.0, *)
protocol AirSettingsUIDependencyProtocol {
    func isSubscriber() throws -> Bool
    func showTermsAndPrivacy(target: UIViewController) throws
    func openAirAppsOne() throws
}

@available(iOS 15.0, *)
extension AirSettingsUIDependency: AirSettingsUIDependencyProtocol {
    public func isSubscriber() throws -> Bool {
        guard isSetup, let delegate else {
            throw AirSettingsUIDependencyError.notSetup
        }
        return delegate.isSubscriber
    }
    
    public func showTermsAndPrivacy(target: UIViewController) throws {
        guard isSetup, let delegate  else {
            throw AirSettingsUIDependencyError.notSetup
        }
        delegate.showTermsAndPrivacy(target: target)
    }
    
    public func openAirAppsOne() throws {
        guard isSetup, let delegate  else {
            throw AirSettingsUIDependencyError.notSetup
        }
        delegate.openAirAppsOne()
    }
}
    
public enum AirSettingsUIDependencyError: Error {
    case notSetup, alreadySetup
}
