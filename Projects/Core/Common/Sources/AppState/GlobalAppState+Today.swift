//
//  GlobalAppState+Today.swift
//  Common
//
//  Created by 이정호 on 1/3/25.
//  Copyright © 2025 sensei.lee. All rights reserved.
//

import Foundation
import Model

public class TodayState: ObservableObject {
    
    @Published var currentItem: Model.Application?
    
    @Published public var isDetailViewShowing = false
    
    public init() {
        
    }
    
}
