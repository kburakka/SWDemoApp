//
//  Category.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation
import UIKit

class Category {
    let id: Int
    let title: String
    let icon: UIImage
    let iconWhite: UIImage
    var isSelected: Bool
    
    init(id: Int, title: String, icon: UIImage, iconWhite: UIImage, isSelected: Bool) {
        self.id = id
        self.title = title
        self.icon = icon
        self.iconWhite = iconWhite
        self.isSelected = isSelected
    }
}
