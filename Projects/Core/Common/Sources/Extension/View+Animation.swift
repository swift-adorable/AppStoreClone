//
//  View+Animation+Ex.swift
//  Common
//
//  Created by 이정호 on 12/19/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

extension View {
    
    public func dampingAnimation(_ isShowingDetail: Binding<Bool>) -> some View {
        self.onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isShowingDetail.wrappedValue.toggle()
            }
        }
        .scaleEffect(isShowingDetail.wrappedValue ? 0.93 : 1)
    }
    
}
