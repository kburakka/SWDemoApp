//
//  CategoryVideoCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation

protocol CategoryVideoCellDataSource: AnyObject {
    var video: Video? { get }
}

protocol CategoryVideoCellEventSource: AnyObject { }

protocol CategoryVideoCellProtocol: CategoryVideoCellDataSource, CategoryVideoCellEventSource { }

final class CategoryVideoCellModel: CategoryVideoCellProtocol {
    var video: Video?
    
    init(video: Video?) {
        self.video = video
    }
}
