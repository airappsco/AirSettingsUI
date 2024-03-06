//
//  AirSettingsUIDependency.swift
//  AirSettingUI
//
//  Created by iOS Developer on 2023-09-28.
//  Copyright © 2023 AirApps. All rights reserved.
//
import Foundation
import UIKit

@available(iOS 15.0, *)
protocol AirSettingsUIDependencyProtocol {
    func isSubscriber() throws -> Bool
    func showTermsAndPrivacy(target: UIViewController) throws
    func openAirAppsOne() throws
}

@available(iOS 15.0, *)
public class AirSettingsUIDependency {
    public static let shared = AirSettingsUIDependency()
    
    public var shareAppURL: URL?
    
    private var isSetup = false
    private var delegate: AirSettingsUIDelegate?
    
    public init(
        shareAppURL: URL? = nil
    ) {
        self.shareAppURL = shareAppURL
    }
    
    func setup(
        delegate: AirSettingsUIDelegate
    ) throws {
        guard !isSetup else {
            throw AirSettingsUIDependencyError.alreadySetup
        }
        self.delegate = delegate
    }
}

@available(iOS 15.0, *)
extension AirSettingsUIDependency: AirSettingsUIDependencyProtocol {
    public func isSubscriber() throws -> Bool {
        guard !isSetup, let delegate else {
            throw AirSettingsUIDependencyError.notSetup
        }
        return delegate.isSubscriber
    }
    
    public func showTermsAndPrivacy(target: UIViewController) throws {
        guard !isSetup, let delegate  else {
            throw AirSettingsUIDependencyError.notSetup
        }
        delegate.showTermsAndPrivacy(target: target)
    }
    
    public func openAirAppsOne() throws {
        guard !isSetup, let delegate  else {
            throw AirSettingsUIDependencyError.notSetup
        }
        delegate.openAirAppsOne()
    }
}
    
public enum AirSettingsUIDependencyError: Error {
    case notSetup, alreadySetup
}
