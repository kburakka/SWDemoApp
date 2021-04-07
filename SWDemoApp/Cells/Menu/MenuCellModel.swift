//
//  MenuCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation

protocol MenuCellDataSource: AnyObject {
    var title: String { get }
    var isSelected: Bool { get }
}

protocol MenuCellEventSource: AnyObject {
    
}

protocol MenuCellProtocol: MenuCellDataSource, MenuCellEventSource {
    
}

final class MenuCellModel: MenuCellProtocol {
    var isSelected: Bool
    
    var title: String
    
    init(title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }
}
