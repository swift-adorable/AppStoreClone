//
//  DefaultSetting.swift
//  ProjectDescriptionHelpers
//
//  Created by 이정호 on 12/10/24.
//

import ProjectDescription

public struct DefaultSetting {
    public static let targetVersion: SettingValue = "16.0"
    public static let appVersion: SettingValue = "1.0.0"
    public static let buildNumber: SettingValue = "0"
    public static let organizationName = "sensei.lee"
    public static let appIdentifier = "appstoreclone"
    
    public static let baseProductSetting: SettingsDictionary = [
        "IPHONEOS_DEPLOYMENT_TARGET": targetVersion
    ]
}

public extension DefaultSetting {
    static func bundleId(moduleName: String) -> String {
        return "com.\(organizationName).\(appIdentifier).\(moduleName.lowercased())"
    }
}


public extension SettingValue {
    var stringValue: String {
        switch self {
        case .string(let string):
            return string
            
        case .array(let array):
            guard let value = array.first else { return "" }
            return value
            
        @unknown default:
            return ""
        }
    }
}
