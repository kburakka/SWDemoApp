//
//  MenuCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation

protocol MenuCellDataSource: AnyObject {
    var title: String { get }
}

protocol MenuCellEventSource: AnyObject {
    
}

protocol MenuCellProtocol: MenuCellDataSource, MenuCellEventSource {
    
}

final class MenuCellModel: MenuCellProtocol {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
