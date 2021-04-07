//
//  HomeViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

protocol HomeViewDataSource {
    var latestUploadModels: [LatestUploadCellModel] { get }
    var categories: [Category] { get }
}

protocol HomeViewEventSource {
    func leftItemAction(from: UIViewController)
    func showMoreAction()
    func categoryDetailAction(id: Int)
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    private lazy var videos = [Video(id: 1,
                                     categoryId: 1,
                                     date: "11/11/2022",
                                     brand: "Apple",
                                     title: "iPhone 11 Plus new cpu",
                                     thumb: thumbUrl,
                                     url: videoUrl),
                               Video(id: 1,
                                     categoryId: 1,
                                     date: "11/11/2022",
                                     brand: "Apple",
                                     title: "iPhone 11 Plus new cpu",
                                     thumb: thumbUrl,
                                     url: videoUrl),
                               Video(id: 1,
                                     categoryId: 1,
                                     date: "11/11/2022",
                                     brand: "Apple",
                                     title: "iPhone 11 Plus new cpu",
                                     thumb: thumbUrl,
                                     url: videoUrl),
                               Video(id: 1,
                                     categoryId: 1,
                                     date: "11/11/2022",
                                     brand: "Apple",
                                     title: "iPhone 11 Plus new cpu",
                                     thumb: thumbUrl,
                                     url: videoUrl),
                               Video(id: 1,
                                     categoryId: 1,
                                     date: "11/11/2022",
                                     brand: "Apple",
                                     title: "iPhone 11 Plus new cpu",
                                     thumb: thumbUrl,
                                     url: videoUrl),
                               Video(id: 1,
                                     categoryId: 1,
                                     date: "11/11/2022",
                                     brand: "Apple",
                                     title: "iPhone 11 Plus new cpu",
                                     thumb: thumbUrl,
                                     url: videoUrl)]
    
    var categories: [Category] = []
    
    let videoUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    let thumbUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg"
    
    lazy var latestUploadModels: [LatestUploadCellModel] = {
        var latestUploadModels: [LatestUploadCellModel] = []
        for video in videos {
            latestUploadModels.append(LatestUploadCellModel(video: video))
        }
        return latestUploadModels
    }()
    
    func leftItemAction(from: UIViewController) {
        router.presentMenu(from: from)
    }
    
    func showMoreAction() {
        router.pushCategoriesBrand(categories: categories)
    }
    
    func categoryDetailAction(id: Int) {
        if let category = categories.first(where: { $0.id == id }) {
            router.pushCategoryDetail(category: category)
        }
    }
}
