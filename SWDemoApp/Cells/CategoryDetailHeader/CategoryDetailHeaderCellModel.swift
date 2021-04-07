//
//  CategoryDetailHeaderCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation

protocol CategoryDetailHeaderCellDataSource: AnyObject {
    var category: Category? { get }
}

protocol CategoryDetailHeaderCellEventSource: AnyObject {}

protocol CategoryDetailHeaderCellProtocol: CategoryDetailHeaderCellDataSource, CategoryDetailHeaderCellEventSource {}

final class CategoryDetailHeaderCellModel: CategoryDetailHeaderCellProtocol {
    var category: Category?
    
    init(category: Category?) {
        self.category = category
    }
}
