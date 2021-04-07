//
//  LatestUploadCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import UIKit

protocol LatestUploadCellDataSource: AnyObject {
    var video: Video { get }
}

protocol LatestUploadCellEventSource: AnyObject { }

protocol LatestUploadCellProtocol: LatestUploadCellDataSource, LatestUploadCellEventSource { }

final class LatestUploadCellModel: LatestUploadCellProtocol {
    var video: Video
    
    init(video: Video) {
        self.video = video
    }
}
