//
//  CategoryCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

protocol CategoryCellDataSource: AnyObject {
    var category: Category { get }
    var tapClosure: VoidClosure? { get set }
}

protocol CategoryCellEventSource: AnyObject {
    func tapButtonAction()
}

protocol CategoryCellProtocol: CategoryCellDataSource, CategoryCellEventSource {}

final class CategoryCellModel: CategoryCellProtocol {
    var category: Category
    
    var tapClosure: VoidClosure?
    
    init(category: Category) {
        self.category = category
    }
    
    func tapButtonAction() {
        category.isSelected.toggle()
        tapClosure?()
    }
}
