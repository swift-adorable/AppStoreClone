//
//  TodayFeatureItemView.swift
//  Today
//
//  Created by 이정호 on 12/16/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI
import Model
import Kingfisher

// 앱 행 뷰
struct TodayFeatureItemView: View {
    
    @State public var app: Model.Application
    
    var body: some View {
        HStack {
            KFImage.url(URL(string: "https://picsum.photos/24/24?random=\(app.id)"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(app.appName)
                    .font(.headline)
                Text(app.appDescription)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {}) {
                Text("GET")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
