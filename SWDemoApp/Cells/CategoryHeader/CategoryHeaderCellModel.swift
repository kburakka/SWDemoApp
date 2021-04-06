//
//  CategoryHeaderCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import Foundation

protocol CategoryHeaderCellDataSource: AnyObject {
    var title: String { get }
}

protocol CategoryHeaderCellEventSource: AnyObject { }

protocol CategoryHeaderCellProtocol: CategoryHeaderCellDataSource, CategoryHeaderCellEventSource { }

final class CategoryHeaderCellModel: CategoryHeaderCellProtocol {
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
