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
    
    func getVideos(completion:@escaping VoidClosure)
}

protocol CategoryDetailViewEventSource {
    func videoTapAction(video: Video?)
}

protocol CategoryDetailViewProtocol: CategoryDetailViewDataSource, CategoryDetailViewEventSource {}

final class CategoryDetailViewModel: BaseViewModel<CategoryDetailRouter>, CategoryDetailViewProtocol {

    var category: Category?
    
    var videos: [Video] = []
    
    func getVideos(completion: @escaping VoidClosure) {
        if let id = category?.id {
            let request = CategoryVideosRequest(id: id)
            showLoadingView()
            dataProvider.fetchData(for: request) { [weak self] (result) in
                guard let self = self else { return }
                self.hideLoadingView()
                switch result {
                case .success(let response):
                    guard let data = response.data else { return }
                    self.videos = data
                    completion()
                case .failure(let error):
                    completion()
                    print(error)
                }
            }
        }
    }
    
    func videoTapAction(video: Video?) {
        router.pushVideoDetail(category: category, video: video)
    }
}
