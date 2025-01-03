//
//  TodayDetailView.swift
//  Today
//
//  Created by 이정호 on 12/17/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

import Common
import Model

public struct TodayDetailView: View {
    
    @Binding private var isShowingDetail: Bool
    @Binding private var item: Model.Application?
    @Binding private var animateView: Bool
    @Binding private var animateContent: Bool
    
    @State private var scrollOffset: CGFloat = 0
    @State private var scaleFactor: CGFloat = 1.0
    @State private var dismissButtonOpacity: CGFloat = 1.0
    
    @EnvironmentObject var globalAppState: GlobalAppState
    
    @Environment(\.dismiss) private var dismiss
    
    let animation: Namespace.ID
    
    public init(isShowingDetail: Binding<Bool>,
                item: Binding<Model.Application?>,
                animateView: Binding<Bool>,
                animateContent: Binding<Bool>,
                animation: Namespace.ID) {
        self._isShowingDetail = isShowingDetail
        self._item = item
        self._animateView = animateView
        self._animateContent = animateContent
        self.animation = animation
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                
                if let item = item {
                    
                    TodayCardSectonView(currentItem: $item,
                                        animationView: $animateView,
                                        item: item,
                                        animation: animation)
                    
                    Spacer(minLength: 15)
                    
                    VStack(spacing: 15) {
                        
                        Text(item.appDetailDescription)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(10)
                            .padding(.bottom, 20)
                        
                        Divider()
                        
                        Button {
                            
                        } label: {
                            Label {
                                Text("Share Story")
                            } icon: {
                                Image(systemName: "square.and.arrow.up.fill")
                            }
                            .foregroundColor(.primary)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 25)
                            .background {
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(.ultraThinMaterial)
                            }
                        }
                    }
                    .padding()
                    .opacity(animateContent ? 1 : 0)
                    
                }
                
            }
            .scaleEffect(animateView ? scaleFactor : 0.93)
            .offset(y: scrollOffset > 0 ? scrollOffset : 0)
            .overlay {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: minY)
                }
            }
        }
        .coordinateSpace(name: "SCROLL")
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            scrollOffset = value
        }
        .onChange(of: scrollOffset) { value in

            // Update scaleFactor and dismissButtonOpacity based on scroll offset
            if value > 0 {
                scaleFactor = max(0.8, min(1.0, 1.0 - value / 500))
                dismissButtonOpacity = max(0.0, min(1.0, 1.0 - value / 100))
            } else {
                scaleFactor = 1.0
                dismissButtonOpacity = 1.0
            }
            
            // Dismiss the view if scrolled down far enough
            if value > 100 {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                    animateView = false
                    animateContent = false
                }
                
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7).delay(0.05)) {
                    item = nil
                    isShowingDetail = false
                    globalAppState.todayState.isDetailViewShowing = false
                }
            }
        }
        .overlay(alignment: .topTrailing) {
            Button {
                // Closing Views
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                    animateView = false
                    animateContent = false
                }
                
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7).delay(0.05)) {
                    item = nil
                    isShowingDetail = false
                    globalAppState.todayState.isDetailViewShowing = false
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.primary)
            }
            .padding()
            .padding(.top, 44)
            .offset(y: -10)
            .opacity(animateView ? dismissButtonOpacity : 0)
        }
        .onAppear {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7)) {
                animateView = true
            }
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7)) {
                animateContent = true
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .transition(.identity)
    }
}
