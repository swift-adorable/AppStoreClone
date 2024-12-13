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

public struct TodayView: View {
    
    @State private var apps = [Model.App]()
    
    public init() { }
    
    public var body: some View {
        
        ScrollView([.vertical, .horizontal], showsIndicators: false) {
            Spacer(minLength: 10)
            VStack {
                ForEach(apps, id: \.self) { app in
                    HStack(spacing: 20) {
                        Text(app.appName)
                        Spacer()
                        Text(app.primaryGenre)
                    }
                }
            }
            Spacer(minLength: 10)
        }
        .padding(.top, 1)
        .padding(.bottom, 52)
        .onAppear {
            apps = Bundle.main.decode(Model.Apps.self, from: "AppStore DummyData.json")
        }
        
    }
    
}

