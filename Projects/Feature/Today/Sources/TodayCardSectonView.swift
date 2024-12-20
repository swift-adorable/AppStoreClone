//
//  TodayCardSectonView.swift
//  Today
//
//  Created by 이정호 on 12/16/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

import Model
import Kingfisher

public struct TodayCardSectonView: View {
    
    let item: Model.Application
    let animation: Namespace.ID
    
    public init(_ item: Model.Application, animation: Namespace.ID) {
        self.item = item
        self.animation = animation
    }
    
    public var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            ZStack(alignment: .topLeading) {
                
                KFImage(URL(string: "https://picsum.photos/512?random=\((0...100).randomElement() ?? 0)"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    if Bool.random() {
                        Text("Now available")
                            .font(.caption)
                            .padding(6)
                            .background(Color.black.opacity(0.6))
                            .foregroundColor(.white)
                            .cornerRadius(4)
                            .padding(8)
                    }
                    
                    Spacer()
                    
                    Text("Today's\n\(item.appDescription)")
                        .font(.largeTitle)
                        .padding(.leading, 6)
                        .fontWeight(.bold)
                    
                    Text(item.platformTitle)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .padding([.bottom, .leading], 6)
                        .foregroundColor(.gray)
                    
                }
                
            }
            
            VStack(alignment: .leading, spacing: 4) {
                
                HStack(spacing: 4) {
                    
                    KFImage(URL(string: "https://picsum.photos/30/30?random=\((0...100).randomElement() ?? 0)"))
                        .resizable()
                        .frame(width: 30, height: 30)
                        .cornerRadius(6)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text(item.appName)
                            .font(.subheadline)
                        
                        Text(item.bannerTitle)
                            .font(.caption2)
                        
                    }
                    
                    Spacer()
                    
                    Image(systemName: "icloud.and.arrow.down")
                        .foregroundColor(.blue)
                    
                }
                
            }
            .padding()
            .background(Color.white)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding(.horizontal)
        .matchedGeometryEffect(id: item.id, in: animation)
        
    }
}
