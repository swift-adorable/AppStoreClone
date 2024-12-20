//
//  Application.swift
//  Model
//
//  Created by 이정호 on 12/19/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import Foundation

extension Model {
    
    public typealias Applications = [Application]

    public struct Application: Codable, Identifiable {
        public let id: String
        public let appName: String
        public let appDescription: String
        public let appLogo: String
        public let bannerTitle: String
        public let platformTitle: String
        public let artwork: String
        public let appDetailDescription: String
    }
    
}
