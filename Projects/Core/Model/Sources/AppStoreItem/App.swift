//
//  App.swift
//  Model
//
//  Created by 이정호 on 12/12/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import Foundation

public extension Model {
    
    typealias Apps = [App]
    
    struct App: Codable, Identifiable, Hashable {
        
        public var id: String {
            return self.appID
        }
        
        public let appID, appName: String
        public let appStoreURL: String
        public let primaryGenre: String
        public let contentRating: String
        public let sizeBytes, requiredIOSVersion: String
        public let released, updated: String
        public let version: String
        public let price: Double
        public let currency: String
        public let free: Bool
        public let developerID: Int
        public let developer: String
        public let developerURL: String
        public let developerWebsite: String
        public let averageUserRating: Double
        public let reviews: Int
        public let currentVersionScore: Double
        public let currentVersionReviews: Int

        enum CodingKeys: String, CodingKey {
            case appID = "App_Id"
            case appName = "App_Name"
            case appStoreURL = "AppStore_Url"
            case primaryGenre = "Primary_Genre"
            case contentRating = "Content_Rating"
            case sizeBytes = "Size_Bytes"
            case requiredIOSVersion = "Required_IOS_Version"
            case released = "Released"
            case updated = "Updated"
            case version = "Version"
            case price = "Price"
            case currency = "Currency"
            case free = "Free"
            case developerID = "DeveloperId"
            case developer = "Developer"
            case developerURL = "Developer_Url"
            case developerWebsite = "Developer_Website"
            case averageUserRating = "Average_User_Rating"
            case reviews = "Reviews"
            case currentVersionScore = "Current_Version_Score"
            case currentVersionReviews = "Current_Version_Reviews"
        }
    }

    
}
