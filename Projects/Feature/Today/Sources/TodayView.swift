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
    
    @State private var apps = [Model.App]()
    @State private var scrollOffset: CGFloat = 0
    
    public init() {
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()//configureWithTransparentBackground()
//        appearance.shadowColor = .clear
//        //appearance.backgroundColor = .systemBackground
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    public var body: some View {
        NavigationStack {
            
            ScrollView {
                VStack(spacing: 20) {
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            CategoryButton(title: "소셜 네트워킹", icon: "bubble.left.and.bubble.right")
                            CategoryButton(title: "엔터테인먼트", icon: "popcorn")
                            CategoryButton(title: "사진 및 비디오", icon: "camera")
                        }
                    }
                    UsefulToolsSection(apps: apps)
                    NewDiscoverySection(apps: apps)
                    TodayFeatureSection()
                    Spacer()
                        .frame(height: 52)
                }
                .trackScrollOffset($scrollOffset)
            }
            .coordinateSpace(name: "scroll")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {

                    if scrollOffset < -10 {
                        Text("투데이")
                            .font(.headline)
                            .fontWeight(.bold)
                    } else {
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
                            
                        }
                        
                    }
                    
//                    HStack(alignment: .firstTextBaseline) {
//                        Text("투데이")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                        Text("12월 16일")
//                            .foregroundColor(.gray)
//                        Spacer()
//                        Text("정호")
//                            .foregroundColor(.gray)
//                            .padding(6)
//                            .background(Color.gray.opacity(0.2))
//                            .clipShape(Circle())
//                    }
                }
            }
        }
        .padding(.top, 0.1)
        .padding(.bottom, 0.1)
        .onAppear {
            let bufApps = Bundle.main.decode(Model.Apps.self, from: "AppStore DummyData.json")
            var rand = [Model.App]()
            for _ in 0..<5 {
                let randIdx = (0...199).randomElement() ?? 0
                let randItem = bufApps[randIdx]
                rand.append(randItem)
            }
            apps = rand
        }
        
    }
    
}

struct AppRowView2: View {
    
    var app: Model.App
    
    var body: some View {
        HStack {
            KFImage.url(URL(string: "https://picsum.photos/24"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(app.appName)
                    .font(.headline)
                Text(app.appStoreURL)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {}) {
                Text("받기")
                    .foregroundColor(.blue)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct UsefulToolsSection: View {
    
    var apps = [Model.App]()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
            Text("유용한 도구")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 0) {
                
                Spacer()
                
                Text("필수 앱")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.leading, 6)
                
                Text("대학 생활 필수 앱")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 6)
                
                ForEach(apps) { app in
                    AppRowView2(app: app)
                }
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
        .padding(.horizontal)
    }
}

struct NewDiscoverySection: View {
    
    @State private var url: URL?
    
    var apps: [Model.App]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("새로운 발견")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 4) {
                KFImage.url(url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                
                Text("고르고 골랐어요")
                    .font(.subheadline)
                    .padding(.top, 8)
                Text("신나는 연말을 위한 최고의 게임")
                    .font(.title2)
                    .fontWeight(.bold)
                
                ForEach(apps) { app in
                    GameRowView(app: app)
                }
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)
        }
        .padding(.horizontal)
        .onAppear() {
            url = URL(string: "https://picsum.photos/seed/picsum/200/60")
        }
    }
}

struct GameRowView: View {
    let app: Model.App
    
    var body: some View {
        HStack {
            KFImage.url(URL(string: "https://picsum.photos/24"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(app.appName)
                    .font(.system(size: 16, weight: .semibold))
                Text(app.appStoreURL)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {}) {
                Text("받기")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.blue)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct TodayFeatureSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topLeading) {
                Image("today-feature")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                
                Text("지금 이용 가능")
                    .font(.caption)
                    .padding(6)
                    .background(Color.black.opacity(0.6))
                    .foregroundColor(.white)
                    .cornerRadius(4)
                    .padding(8)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("신규 캐릭터")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("거대한 어둠에 맞서는\n새로운 힘의 탄생")
                    .font(.title2)
                    .fontWeight(.bold)
                
                HStack {
                    Image("game-icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .cornerRadius(6)
                    Text("메이플스토리M")
                        .font(.subheadline)
                    Spacer()
                    Image(systemName: "icloud.and.arrow.down")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .background(Color.white)
        }
        .background(Color(red: 0.6, green: 0.2, blue: 0.4))
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct CategoryButton: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color(.systemGray6))
        .cornerRadius(15)
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

// 스크롤 오프셋을 감지하기 위한 ViewModifier
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func trackScrollOffset(_ offset: Binding<CGFloat>) -> some View {
        
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

//        ScrollView([.vertical, .horizontal], showsIndicators: false) {
//            Spacer(minLength: 10)
//            VStack {
//                ForEach(apps, id: \.self) { app in
//                    HStack(spacing: 20) {
//                        Text(app.appName)
//                        Spacer()
//                        Text(app.primaryGenre)
//                    }
//                }
//            }
//            Spacer(minLength: 10)
//        }
        
//        List(apps) { app in
//            TodayItemCell(with: app)
//        }.listStyle(.plain)
        
//        ScrollView {
//            VStack(spacing: 20) {
//                // 유용한 도구 섹션
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("유용한 도구")
//                        .font(.title2)
//                        .bold()
//
//                    VStack(spacing: 0) {
//                        ForEach(apps) { app in
//                            AppRowView(app: app)
//                        }
//                    }
//                    .background(Color.white)
//                    .cornerRadius(12)
//                    .shadow(radius: 5)
//                }
//                .padding(.horizontal)
//
//                // 새로운 발견 섹션
//                FeaturedAppView(title: "새로운 발견")
//
//                // 투데이 섹션
//                TodayFeaturedView()
//            }
//        }
        
//        NavigationStack {
//            ScrollView {
//                VStack(spacing: 20) {
//                    // 유용한 도구 섹션
//                    VStack(alignment: .leading, spacing: 10) {
//                        Text("유용한 도구")
//                            .font(.title2)
//                            .bold()
//
//                        VStack(spacing: 0) {
//                            ForEach(apps) { app in
//                                AppRowView(app: app)
//                            }
//                        }
//                        .background(Color.white)
//                        .cornerRadius(12)
//                        .shadow(radius: 5)
//                    }
//                    .padding(.horizontal)
//
//                    // 새로운 발견 섹션
//                    FeaturedAppView(title: "새로운 발견")
//                        .padding(.horizontal)
//
//                    // 투데이 섹션
//                    TodayFeaturedView()
//                        .padding(.horizontal)
//                }
//            }
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    HStack {
//                        Text("투데이")
//                            .font(.title2)
//                            .bold()
//                        Text("12월 16일")
//                            .foregroundColor(.gray)
//                        Spacer()
//                        Text("정호")
//                            .foregroundColor(.gray)
//                    }
//                    .frame(maxWidth: .infinity)
//                }
//            }
//        }
