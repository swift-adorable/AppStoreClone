//
//  TodayFeatuerView.swift
//  Today
//
//  Created by 이정호 on 12/16/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

// 투데이 피처드 뷰
struct TodayFeaturedView: View {
    var body: some View {
        
        VStack {
            Image("today-feature")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("신규 캐릭터")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("거대한 어둠에 맞서는\n새로운 힘의 탄생")
                    .font(.title3)
                    .bold()
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
        
//        VStack(alignment: .leading) {
//            HStack {
//                Text("투데이")
//                    .font(.title2)
//                    .bold()
//                Text("12월 16일")
//                    .foregroundColor(.gray)
//                Spacer()
//                Text("정호")
//                    .foregroundColor(.gray)
//            }
//            
//            VStack {
//                Image("today-feature")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(12)
//                
//                VStack(alignment: .leading, spacing: 5) {
//                    Text("신규 캐릭터")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                    Text("거대한 어둠에 맞서는\n새로운 힘의 탄생")
//                        .font(.title3)
//                        .bold()
//                }
//                .padding()
//            }
//            .background(Color.white)
//            .cornerRadius(12)
//            .shadow(radius: 5)
//        }
//        .padding(.horizontal)
    }
}
