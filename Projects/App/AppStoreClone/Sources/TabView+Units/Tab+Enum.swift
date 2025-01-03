//
//  Tab+Enum.swift
//  AppStoreClone
//
//  Created by 이정호 on 12/12/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

import Today
import Common

@MainActor
public enum Tab: String, CaseIterable {
    case today = "Today"
    case app = "App"
    case game = "Game"
    case arcade = "Arcade"
    case search = "Search"
}

public extension Tab {
    
    @ViewBuilder
    func unitView(_ animation: Namespace.ID) -> some View {
        switch self {
        case .today:
            TodayView(animation)
        case .app:
            AppView()
        case .game:
            GameView()
        case .arcade:
            ArcadeView()
        case .search:
            SearchView()
        }
    }
    
    nonisolated var imageSystemName: String {
        switch self {
        case .today:
            "doc.text.image"
        case .app:
            "square.stack.3d.up.fill"
        case .game:
            "gamecontroller"
        case .arcade:
            "teddybear.fill"
        case .search:
            "magnifyingglass"
        }
    }
    
}
