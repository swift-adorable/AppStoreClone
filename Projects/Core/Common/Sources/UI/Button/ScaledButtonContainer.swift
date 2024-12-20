//
//  ScaledButtonContainer.swift
//  Common
//
//  Created by 이정호 on 12/19/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

public struct ScaledButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label.scaleEffect(configuration.isPressed ? 0.93 : 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

public struct ScaledButtonContainer<Item: Identifiable, Content: View>: View {
    let action: () -> Void
    let content: () -> Content
    @Binding var currentItem: Item?
    @Binding var isShowDetailPage: Bool
    let item: Item

    public init(action: @escaping () -> Void,
         currentItem: Binding<Item?>,
         isShowDetailPage: Binding<Bool>,
         item: Item,
         @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self._currentItem = currentItem
        self._isShowDetailPage = isShowDetailPage
        self.item = item
        self.content = content
    }

    public var body: some View {
        
        Button {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7)) {
                action()
            }
        } label: {
            content()
                .scaleEffect(currentItem?.id == item.id && isShowDetailPage ? 1 : 0.93)
        }
        .buttonStyle(ScaledButtonStyle())
        .opacity(isShowDetailPage ? (currentItem?.id == item.id ? 1 : 0) : 1)
        
    }
    
}
