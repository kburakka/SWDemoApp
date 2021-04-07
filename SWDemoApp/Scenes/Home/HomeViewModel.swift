//
//  HomeViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

protocol HomeViewDataSource {
    var latestUploadModels: [LatestUploadCellModel] { get }
    var categoryModels: [CategoryCellModel] { get }
}

protocol HomeViewEventSource {
    func leftItemAction(from: UIViewController)
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    
    var categoryModels: [CategoryCellModel] = []
    
    let videoUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    let thumbUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg"
    
    lazy var latestUploadModels: [LatestUploadCellModel] = [LatestUploadCellModel(brand: "Apple",
                                                                                  title: "iPhone 11 Plus new cpu",
                                                                                  url: videoUrl,
                                                                                  thumb: thumbUrl),
                                                            LatestUploadCellModel(brand: "Apple",
                                                                                  title: "iPhone 11 Plus new cpu",
                                                                                  url: videoUrl,
                                                                                  thumb: thumbUrl),
                                                            LatestUploadCellModel(brand: "Apple",
                                                                                  title: "iPhone 11 Plus new cpu",
                                                                                  url: videoUrl,
                                                                                  thumb: thumbUrl),
                                                            LatestUploadCellModel(brand: "Apple",
                                                                                  title: "iPhone 11 Plus new cpu",
                                                                                  url: videoUrl,
                                                                                  thumb: thumbUrl),
                                                            LatestUploadCellModel(brand: "Apple",
                                                                                  title: "iPhone 11 Plus new cpu",
                                                                                  url: videoUrl,
                                                                                  thumb: thumbUrl),
                                                            LatestUploadCellModel(brand: "Apple",
                                                                                  title: "iPhone 11 Plus new cpu",
                                                                                  url: videoUrl,
                                                                                  thumb: thumbUrl),
                                                            LatestUploadCellModel(brand: "Apple",
                                                                                  title: "iPhone 11 Plus new cpu",
                                                                                  url: videoUrl,
                                                                                  thumb: thumbUrl)]
    
    func leftItemAction(from: UIViewController) {
        router.presentMenu(from: from)
    }
}
