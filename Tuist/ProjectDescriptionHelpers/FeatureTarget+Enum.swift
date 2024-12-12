//
//  FeatureTarget+Enum.swift
//  AppStoreCloneManifests
//
//  Created by 이정호 on 12/6/24.
//

import Foundation
import ProjectDescription

public enum FeatureTarget: CaseIterable {
    case app
    case framework
    case frameworkResources
    case tests
    case example
    case testing
    case generateAssets
}
