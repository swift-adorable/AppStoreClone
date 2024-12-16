//
//  TodayItemCell.swift
//  Today
//
//  Created by 이정호 on 12/16/24.
//  Copyright © 2024 sensei.lee. All rights reserved.
//

import SwiftUI
import Model
import Kingfisher

public struct TodayItemCell: View {
    
    private let item: Model.App
    
    public init(with item: Model.App) {
        self.item = item
    }
    
    private var tempUrl: URL? {
        let urlPrefix = "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/Loading/kingfisher"
        return URL(string: "\(urlPrefix)-\((0...10).randomElement() ?? 0).jpg")
    }
    
    public var body: some View {
        HStack {
            
            KFImage.url(tempUrl)
//                .placeholder(placeholderImage)
//                .setProcessor(.)
                .loadDiskFileSynchronously()
                .cacheMemoryOnly()
                .fade(duration: 0.25)
                .resizable()
                .roundCorner(
                    radius: .widthFraction(0.5),
                    roundingCorners: [.all]
                )
                .onSuccess { result in
                    print("Image loaded from cache: \(result.cacheType)")
                }
                .onFailure { error in
                    print("Error: \(error)")
                }
                .serialize(as: .PNG)
                .frame(width: 64, height: 64)
            
//            Image(systemName: "star")
//                .foregroundColor(.yellow)
            
            VStack(alignment: .leading) {
                Text(item.appName)
                    .font(.headline)
                Text("Description for \(item.appStoreURL)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
