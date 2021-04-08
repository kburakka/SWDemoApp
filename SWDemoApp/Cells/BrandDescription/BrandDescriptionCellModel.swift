//
//  BrandDescriptionCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import Foundation

protocol BrandDescriptionCellDataSource: AnyObject {
    var title: String? { get }
    var description: String? { get }
    var numberOfDescLines: Int? { get }
}

protocol BrandDescriptionCellEventSource: AnyObject { }

protocol BrandDescriptionCellProtocol: BrandDescriptionCellDataSource, BrandDescriptionCellEventSource { }

final class BrandDescriptionCellModel: BrandDescriptionCellProtocol {
    var numberOfDescLines: Int?
    
    var title: String?
    
    var description: String?
    
    init(title: String? = nil, description: String? = nil, numberOfDescLines: Int) {
        self.title = title
        self.description = description
        self.numberOfDescLines = numberOfDescLines
    }
    
}
