//
//  Video.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation

public struct Video: Decodable {
    let id: String
    let categoryID: String
    let date: String
    let brand: String
    var title: String
    let thumb: String
    var url: String
    
    init(id: String, categoryId: String, date: String, brand: String, title: String, thumb: String, url: String) {
        self.id = id
        self.categoryID = categoryId
        self.date = date
        self.brand = brand
        self.title = title
        self.thumb = thumb
        self.url = url
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case categoryID = "categoryId"
        case date, brand, title
        case thumb = "Thumb"
        case url
    }
}
