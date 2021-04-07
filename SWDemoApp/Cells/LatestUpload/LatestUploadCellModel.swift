//
//  LatestUploadCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import UIKit

protocol LatestUploadCellDataSource: AnyObject {
    var brand: String { get }
    var title: String { get }
    var url: String { get }
    var thumb: String { get }
}

protocol LatestUploadCellEventSource: AnyObject { }

protocol LatestUploadCellProtocol: LatestUploadCellDataSource, LatestUploadCellEventSource { }

final class LatestUploadCellModel: LatestUploadCellProtocol {    
    var brand: String
    
    var title: String
    
    var url: String
    
    var thumb: String
    
    init(brand: String, title: String, url: String, thumb: String) {
        self.brand = brand
        self.title = title
        self.url = url
        self.thumb = thumb
    }
}
