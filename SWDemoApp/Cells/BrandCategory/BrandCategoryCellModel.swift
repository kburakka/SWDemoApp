//
//  BrandCategoryCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import Foundation

protocol BrandCategoryCellDataSource: AnyObject {
    var categories: [Category] { get }
    var title: String { get }
}

protocol BrandCategoryCellEventSource: AnyObject { }

protocol BrandCategoryCellProtocol: BrandCategoryCellDataSource, BrandCategoryCellEventSource { }

final class BrandCategoryCellModel: BrandCategoryCellProtocol {
    var title: String
    
    var categories: [Category]

    init(categories: [Category], title: String) {
        self.categories = categories
        self.title = title
    }
}
