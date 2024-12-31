//
//  View+NavigationBAr.swift
//  Common
//
//  Created by 이정호 on 12/30/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI

extension View {
    
    public func setNavigationBarTransparentBackground(_ color: UIColor = .clear, _ alpha: CGFloat = 0.8) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .systemBackground.withAlphaComponent(alpha)
        appearance.shadowColor = color
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
}
