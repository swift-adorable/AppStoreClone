//
//  TodayFeatureListSectionView.swift
//  Today
//
//  Created by 이정호 on 12/17/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

import Model
import Kingfisher

struct TodayFeatureListSectionView: View {
    
    let title: String
    let subtitle: String?
    let headerTitle: String?
    let apps: Model.Applications
    let headerImage: URL?
    
    init(
        title: String,
        subtitle: String? = nil,
        headerTitle: String? = nil,
        apps: Model.Applications,
        headerImage: URL? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.headerTitle = headerTitle
        self.apps = apps
        self.headerImage = headerImage
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 0) {
                if let headerImage = headerImage {
                    KFImage.url(headerImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                }
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                        .padding(.leading, 6)
                }
                
                if let headerTitle = headerTitle {
                    Text(headerTitle)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 6)
                }
                
                ForEach(apps) { app in
                    TodayFeatureItemView(app: app)
                }
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
        .padding(.horizontal)
    }
    
}
