//
//  Bundle+Common+Ex.swift
//  Today
//
//  Created by 이정호 on 12/31/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import Foundation

// Common 모듈의 Bundle에 접근하기 위한 코드
extension Bundle {
    static var common: Bundle? {
        let bundleName = "Common"
        
        // Core 프레임워크 내의 Common 번들 찾기
        for bundle in Bundle.allFrameworks {
            if bundle.bundleURL.lastPathComponent == "\(bundleName).framework" {
                return bundle
            }
        }
        return nil
    }
}
