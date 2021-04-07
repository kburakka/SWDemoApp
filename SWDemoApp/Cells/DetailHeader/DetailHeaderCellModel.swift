//
//  DetailHeaderCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation

protocol DetailHeaderCellDataSource: AnyObject {
    var category: Category? { get }
    var video: Video? { get }
    var detailType: DetailType { get }
}

protocol DetailHeaderCellEventSource: AnyObject {}

protocol DetailHeaderCellProtocol: DetailHeaderCellDataSource, DetailHeaderCellEventSource {}

final class DetailHeaderCellModel: DetailHeaderCellProtocol {
    var video: Video?
    
    var detailType: DetailType
    
    var category: Category?
    
    init(category: Category? = nil, video: Video? = nil, detailType: DetailType) {
        self.category = category
        self.video = video
        self.detailType = detailType
    }
}
