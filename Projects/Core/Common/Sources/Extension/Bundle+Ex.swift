//
//  Bundle+Ex.swift
//  Common
//
//  Created by 이정호 on 12/12/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import Foundation

// Common 모듈의 번들을 찾기 위한 클래스
//private class BundleFinder {}

public extension Bundle {
    
    static var common: Bundle {
        let bundleName = "Common"
        print("Bundle.allFrameworks: \(Bundle.allFrameworks.count)")
        // Core 프레임워크 내의 Common 번들 찾기
        for bundle in Bundle.allFrameworks {
            if bundle.bundleURL.lastPathComponent == "\(bundleName).framework" {
                return bundle
            }
        }
        
        fatalError("Unable to find bundle named \(bundleName)")
        
    }
    
}


public extension Bundle {
    
    func decode<T: Decodable>(_ type: T.Type, 
                              from file: String,
                              dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                              keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
    
}
