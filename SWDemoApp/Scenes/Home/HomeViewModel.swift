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
    var selectedCategories: [Category] { get }
    
    func getLatestVideos(completion: @escaping (([Video]?) -> Void))
    func getlatestUploadModels(completion: @escaping VoidClosure)
}

protocol HomeViewEventSource {
    func leftItemAction(from: UIViewController)
    func showMoreAction()
    func categoryDetailAction(id: String)
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    
    var videos: [Video] = []
    
    var categories: [Category] = []
    
    lazy var selectedCategories: [Category] = {
        var categories: [Category] = []
        let categoriIds = UserDefaultsHelper.getData(type: [String].self, forKey: .selectedCategories) ?? []
        for id in categoriIds {
            if let category = self.categories.first(where: { $0.id == id }) {
                categories.append(category)
            }
        }
        return categories
    }()
    
    var latestUploadModels: [LatestUploadCellModel] = []
    
    func leftItemAction(from: UIViewController) {
        router.presentMenu(from: from)
    }
    
    func showMoreAction() {
        router.pushCategoriesBrand(categories: categories)
    }
    
    func categoryDetailAction(id: String) {
        if let category = categories.first(where: { $0.id == id }) {
            router.pushCategoryDetail(category: category)
        }
    }
    
    func getLatestVideos(completion: @escaping (([Video]?) -> Void)) {
        let request = LatestVideosRequest()
        showLoadingView()
        dataProvider.fetchData(for: request) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoadingView()
            switch result {
            case .success(let response):
                guard let data = response.data else {
                    self.router.presentAlert(title: "Some thing went wrong!", buttonTitle: "Close")
                    return
                }
                completion(data)
            case .failure(let error):
                self.router.presentAlert(title: error.message ?? "Some thing went wrong!", buttonTitle: "Close")
            }
        }
    }
    
    func getlatestUploadModels(completion: @escaping VoidClosure) {
        getLatestVideos { (videos) in
            self.videos = videos ?? []
            var latestUploadModels: [LatestUploadCellModel] = []
            for video in self.videos {
                latestUploadModels.append(LatestUploadCellModel(video: video))
            }
            self.latestUploadModels = latestUploadModels
            completion()
        }
    }
}
