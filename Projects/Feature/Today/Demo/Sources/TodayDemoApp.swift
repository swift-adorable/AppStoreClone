//
//  TodayDemoApp.swift
//  TodayDemo
//
//  Created by 이정호 on 12/23/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

import Today

@main
struct TodayDemoApp: App {
    
    @Namespace var animation
    
    var body: some Scene {
        WindowGroup {
            TodayView(animation)
        }
    }
}
