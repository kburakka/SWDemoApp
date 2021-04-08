//
//  BrandVideoCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import Foundation

protocol BrandVideoCellDataSource: AnyObject {
    var video: Video? { get }
}

protocol BrandVideoCellEventSource: AnyObject { }

protocol BrandVideoCellProtocol: BrandVideoCellDataSource, BrandVideoCellEventSource { }

final class BrandVideoCellModel: BrandVideoCellProtocol {
    
    var video: Video?
    
    init(video: Video?) {
        self.video = video
    }
}
