//
//  Video.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation

class Video {
    let id: Int
    let categoryId: Int
    let date: String
    let brand: String
    var title: String
    let thumb: String
    var url: String
    
    init(id: Int, categoryId: Int, date: String, brand: String, title: String, thumb: String, url: String) {
        self.id = id
        self.categoryId = categoryId
        self.date = date
        self.brand = brand
        self.title = title
        self.thumb = thumb
        self.url = url
    }
}
