//
//  CategoryCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

protocol CategoryCellDataSource: AnyObject {
    var title: String { get }
    var icon: UIImage { get }
    var isSelected: Bool { get }
    var tapClosure: VoidClosure? { get set }
}

protocol CategoryCellEventSource: AnyObject {
    func tapButtonAction()
}

protocol CategoryCellProtocol: CategoryCellDataSource, CategoryCellEventSource {}

final class CategoryCellModel: CategoryCellProtocol {
    var isSelected: Bool
    
    var tapClosure: VoidClosure?
    
    var title: String
    
    var icon: UIImage
    
    init(title: String, icon: UIImage, isSelected: Bool) {
        self.icon = icon
        self.title = title
        self.isSelected = isSelected
    }
    
    func tapButtonAction() {
        isSelected.toggle()
        tapClosure?()
    }
}
