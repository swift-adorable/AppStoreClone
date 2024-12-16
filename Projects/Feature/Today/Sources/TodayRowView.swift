//
//  TodayRowView.swift
//  Today
//
//  Created by 이정호 on 12/16/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI
import Model

// 앱 행 뷰
struct AppRowView: View {
    let app: Model.App
    
    var body: some View {
        HStack {
            Image(app.appName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(app.appName)
                    .font(.system(size: 16, weight: .semibold))
                Text(app.appStoreURL)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("받기")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.blue)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 6)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
            }
        }
        .padding()
    }
}
