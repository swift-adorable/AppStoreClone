//
//  AppState.swift
//  Common
//
//  Created by 이정호 on 1/2/25.
//  Copyright © 2025 sensei.lee. All rights reserved.
//

import Foundation
import Model

public class GlobalAppState: ObservableObject {
    
    @Published public var todayState: TodayState
    
    public init() {
        self.todayState = TodayState()
    }
    
}
