//
//  TodayView.swift
//  Today
//
//  Created by 이정호 on 12/13/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

import Common
import Model
import Kingfisher

@MainActor
public struct TodayView: View {
    
    @State private var apps = Model.Applications()
    @State private var currentItem: Model.Application?
    @State private var isShowDetailPage: Bool = false
    @State private var scrollOffset: CGFloat = 0
    
    var animation: Namespace.ID
    
    @EnvironmentObject var globalAppState: GlobalAppState
    
    // 새로 추가된 애니메이션 프로퍼티
    @State private var animateView: Bool = false
    @State private var animateContent: Bool = false
    
    public init(_ animation: Namespace.ID) {
        self.animation = animation
        setNavigationBarTransparentBackground()
    }
    
    public var body: some View {
        
        NavigationStack {
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .firstTextBaseline) {
                            Text("투데이")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("12월 16일")
                                .foregroundColor(.gray)
                            Spacer()
                            ProfileButton()
                        }
                        
                    }.padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            CategoryButton(title: "소셜 네트워킹", icon: "bubble.left.and.bubble.right")
                            CategoryButton(title: "엔터테인먼트", icon: "popcorn")
                            CategoryButton(title: "사진 및 비디오", icon: "camera")
                        }
                        .padding([.horizontal, .vertical])
                    }
                                        
                    ForEach(apps) { item in
                        ScaledButtonContainer(
                            action: {
                                currentItem = item
                                isShowDetailPage = true
                                globalAppState.todayState.isDetailViewShowing = true
                            },
                            currentItem: $currentItem,
                            isShowDetailPage: $isShowDetailPage,
                            item: item,
                            content: {
                                TodayCardSectonView(currentItem: $currentItem,
                                                    animationView: $animateView,
                                                    item: item,
                                                    animation: animation)
                            }
                        )
                    }
                    
                    Spacer()
                        .frame(height: 52)
                }
                .trackScrollOffset($scrollOffset)
            }
            .coordinateSpace(name: "scroll")
        }.overlay {
            if isShowDetailPage {
                Color.black.opacity(0.35)
                    .ignoresSafeArea()
                    .transition(.opacity)
                
                TodayDetailView(isShowingDetail: $isShowDetailPage,
                                item: $currentItem,
                                animateView: $animateView,
                                animateContent: $animateContent,
                                animation: animation)
                    .transition(.asymmetric(insertion: .identity, removal: .offset(y: 10)))
                    .interactiveDismissDisabled()
            }
        }
        .padding(.top, 0.1)
        .padding(.bottom, 0.1)
        .onAppear {
            // 사용할 때
            let data = Bundle.common.decode(Model.Applications.self, from: "DummyData.json")
            var rand = Model.Applications()
            for _ in 0..<5 {
                let randIdx = (0..<15).randomElement() ?? 0
                let randItem = data[randIdx]
                rand.append(randItem)
            }
            apps = rand

        }.onReceive(globalAppState.todayState.$isDetailViewShowing) { isDetailViewShowing in
            print("is Showed DetailView changed to: \(isDetailViewShowing) on today view")
        }
        
    }
    
}

struct CategoryButton: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
            Text(title)
                .font(.caption)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 3)

    }
}

struct ProfileButton: View {
    var body: some View {
        Text("정호")
            .foregroundColor(.gray)
            .padding(8)
            .background(Color.gray.opacity(0.2))
            .clipShape(Circle())
    }
}
