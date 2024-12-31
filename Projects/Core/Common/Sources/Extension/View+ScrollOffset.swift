//
//  View+ScrollOffest+Ex.swift
//  Common
//
//  Created by 이정호 on 12/19/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

// 스크롤 오프셋을 감지하기 위한 ViewModifier
public struct ScrollOffsetPreferenceKey: PreferenceKey {
    
    public static var defaultValue: CGFloat = 0
    
    public static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
}

extension View {
    
    public func trackScrollOffset(_ offset: Binding<CGFloat>) -> some View {
        
        overlay(
            GeometryReader { proxy in
                Color.clear.preference(
                    key: ScrollOffsetPreferenceKey.self,
                    value: proxy.frame(in: .named("scroll")).minY
                )
            }
        )
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            withAnimation(.easeInOut(duration: 0.3)) {
                offset.wrappedValue = value
            }
        }
    }
    
}
