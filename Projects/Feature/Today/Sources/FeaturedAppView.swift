//
//  FeaturedAppView.swift
//  Today
//
//  Created by 이정호 on 12/16/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

// 피처드 앱 뷰
struct FeaturedAppView: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .bold()
            
            Image("featured-image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}


