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
    
    @Binding private var currentItem: Model.Application?
    @Binding private var animateView: Bool
    private let item: Model.Application
    private let animation: Namespace.ID
    
    public init(currentItem: Binding<Model.Application?>,
                animationView: Binding<Bool>,
                item: Model.Application,
                animation: Namespace.ID) {
        self._currentItem = currentItem
        self._animateView = animationView
        self.item = item
        self.animation = animation
    }
    
    public var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            ZStack(alignment: .topLeading) {
                
                GeometryReader { proxy in
                    let size = proxy.size
                    KFImage(URL(string: "https://picsum.photos/512?random=\((0...100).randomElement() ?? 0)"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                }
                .frame(height: 400)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    if Bool.random() {
                        Text("Now available")
                            .padding(4)
                            .font(.caption)
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
                    
                }.frame(height: 400)
                //.foregroundColor(.primary)
                //.padding()
                //.offset(y: currentItem?.id == item.id && animateView ? 44 : 0)
                
            }
            
            Spacer()
            
            HStack(spacing: 4) {
                
                KFImage(URL(string: "https://picsum.photos/30/30?random=\((0...100).randomElement() ?? 0)"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                
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
            .padding([.vertical, .horizontal])
            
        }
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color(.tertiarySystemBackground))
        }
        .matchedGeometryEffect(id: item.id, in: animation)
//        .background(Color.white)
//        .cornerRadius(12)
//        .shadow(radius: 5)
//        .padding(.horizontal)
//        .matchedGeometryEffect(id: item.id, in: animation)
        
    }
}
