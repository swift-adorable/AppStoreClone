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

public struct TodayView: View {
    @State private var apps = Model.Applications()
    @State private var currentItem: Model.Application?
    @State private var isShowDetailPage: Bool = false
    @State private var scrollOffset: CGFloat = 0
    
    @Namespace private var animation
    
    public init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .systemBackground.withAlphaComponent(0.8)
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    public var body: some View {
        
        NavigationStack {
            
            ScrollView {
                VStack(spacing: 0) {
                    
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
                        .padding(.horizontal)
                        .padding(.vertical)
                        
                    }
                    
//                    VStack(spacing: 20) {
//                        List(apps) { item in
//                            ScaledButtonContainer(
//                                action: {
//                                    currentItem = item
//                                    isShowDetailPage = true
//                                },
//                                currentItem: $currentItem,
//                                isShowDetailPage: $isShowDetailPage,
//                                item: item,
//                                content: {
//                                    TodayCardSectonView(item)
//                                }
//                            )
//                        }.listStyle(.plain)
//                    }
                    
                    
                    ForEach(apps) { item in
                        ScaledButtonContainer(
                            action: {
                                currentItem = item
                                isShowDetailPage = true
                            },
                            currentItem: $currentItem,
                            isShowDetailPage: $isShowDetailPage,
                            item: item,
                            content: {
                                TodayCardSectonView(item, animation: animation)
                            }
                        )
                    }
                    
                    TodayFeatureListSectionView(
                        title: "유용한 도구",
                        subtitle: "필수 앱",
                        headerTitle: "대학 생활 필수 앱",
                        apps: apps
                    ).dampingAnimation($isShowDetailPage)
                    
                    TodayFeatureListSectionView(
                        title: "새로운 발견",
                        subtitle: "고르고 골랐어요",
                        headerTitle: "신나는 연말을 위한 최고의 게임",
                        apps: apps,
                        headerImage: URL(string: "https://picsum.photos/seed/picsum/200/60")
                    ).dampingAnimation($isShowDetailPage)
                    
                    if let item = apps.randomElement() {
                        TodayCardSectonView(item, animation: animation)
                            .dampingAnimation($isShowDetailPage)
                    }
                    
                    Spacer()
                        .frame(height: 52)
                }
                .trackScrollOffset($scrollOffset)
            }
            .coordinateSpace(name: "scroll")
        }.overlay {
            if isShowDetailPage, let currentItem = currentItem {
                Color.black.opacity(0.35)
                    .ignoresSafeArea()
                    .transition(.opacity)
                
                TodayDetailView(isShowingDetail: $isShowDetailPage, 
                                animation: animation,
                                item: currentItem)
                    .interactiveDismissDisabled()
            }
        }
        .padding(.top, 0.1)
        .padding(.bottom, 0.1)
        .onAppear {
            let bufApps = Bundle.main.decode(Model.Applications.self, from: "DummyData.json")
            var rand = Model.Applications()
            for _ in 0..<5 {
                let randIdx = (0..<15).randomElement() ?? 0
                let randItem = bufApps[randIdx]
                rand.append(randItem)
            }
            apps = rand
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
