//
//  CategoryDetailViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation

protocol CategoryDetailViewDataSource {
    var videos: [Video] { get }
    var category: Category? { get }
}

protocol CategoryDetailViewEventSource {}

protocol CategoryDetailViewProtocol: CategoryDetailViewDataSource, CategoryDetailViewEventSource {}

final class CategoryDetailViewModel: BaseViewModel<CategoryDetailRouter>, CategoryDetailViewProtocol {
    var category: Category?
    
    let videoUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    let thumbUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg"
    
    lazy var videos = [Video(id: 1,
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
}
