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

struct TodayDetailView: View {
    
    @Binding var isShowingDetail: Bool
    @State private var scrollOffset: CGFloat = 0
    @State private var animateView: Bool = false
    @State private var animateContent: Bool = false
    
    let item: Model.Application
    let animation: Namespace.ID
    
    public init(isShowingDetail: Binding<Bool>, animation: Namespace.ID, item: Model.Application) {
        self._isShowingDetail = isShowingDetail
        self.animation = animation
        self.item = item
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
                TodayCardSectonView(item, animation: animation)
                    .scaleEffect(animateView ? 1 : 0.93)
                
                VStack(spacing: 15) {
                    Text(item.appDetailDescription)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                        .padding(.bottom, 20)
                    Divider()
                    
                    Button {
                        // Share action
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
                .offset(y: scrollOffset > 0 ? scrollOffset : 0)
                .opacity(animateContent ? 1 : 0)
                .scaleEffect(animateView ? 1 : 0, anchor: .top)
            }
            .offset(y: scrollOffset > 0 ? -scrollOffset : 0)
            .overlay {
                GeometryReader { proxy in
                    Color.clear.preference(
                        key: ScrollOffsetPreferenceKey.self,
                        value: proxy.frame(in: .named("SCROLL")).minY
                    )
                }
            }
        }
        .coordinateSpace(name: "SCROLL")
        .background(Color(.systemBackground))
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            scrollOffset = value
            print("value: \(value)")
            if value > 120 {
                closeView()
            }
        }
        .overlay(alignment: .topTrailing) {
            Button {
                closeView()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
            }
            .padding(.top, 50)
            .padding(.trailing, 20)
            .opacity(animateView ? 1 : 0)
        }
        .ignoresSafeArea()
        .transition(
            .asymmetric(
                insertion: .move(edge: .bottom),
                removal: .move(edge: .bottom)
            )
        )
        .onAppear {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7)) {
                animateView = true
            }
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7).delay(0.1)) {
                animateContent = true
            }
        }
        .matchedGeometryEffect(id: item.id, in: animation)
    }
    
    private func closeView() {
        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7)) {
            animateView = false
            animateContent = false
        }
        
        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7).delay(0.05)) {
            isShowingDetail = false
        }
    }
}
