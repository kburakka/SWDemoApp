//
//  Category.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation
import UIKit

public class Category: Codable {
    let id: String
    let title: String
    var icon: UIImage?
    var iconWhite: UIImage?
    var isSelected: Bool?
    var videoCount: Int

    init(id: String, title: String, icon: UIImage, iconWhite: UIImage, isSelected: Bool, videoCount: Int) {
        self.id = id
        self.title = title
        self.icon = icon
        self.iconWhite = iconWhite
        self.isSelected = isSelected
        self.videoCount = videoCount
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case videoCount = "video_count"
    }
}
