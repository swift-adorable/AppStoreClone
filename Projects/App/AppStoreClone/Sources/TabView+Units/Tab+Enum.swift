//
//  Tab+Enum.swift
//  AppStoreClone
//
//  Created by 이정호 on 12/12/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

public enum Tab: String, CaseIterable {
    case today = "today"
    case app = "app"
    case game = "game"
    case arcade = "arcade"
    case search = "search"
}

public extension Tab {
    
    @ViewBuilder
    var unitView: some View {
        switch self {
        case .today:
            TodayView()
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
    
    var imageSystemName: String {
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
