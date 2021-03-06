//
//  BrandDetailViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import Foundation

protocol BrandDetailViewDataSource {
    var video: Video? { get }
    var categories: [Category] { get }
    var aboutUsCellModel: BrandDescriptionCellModel { get }
    var segmentCellModel: SegmentedControlCellModel { get }
    var categoriesCellModel: BrandCategoryCellModel { get }
    var segmentedControlClosure: IntClosure? { get set }
    var segmentSelectedIndex: Int { get }
    
    func getCategories(completion: @escaping VoidClosure)
}

protocol BrandDetailViewEventSource {}

protocol BrandDetailViewProtocol: BrandDetailViewDataSource, BrandDetailViewEventSource {}

final class BrandDetailViewModel: BaseViewModel<BrandDetailRouter>, BrandDetailViewProtocol {
    var categories: [Category] = []

    
    var segmentSelectedIndex: Int = 0
    
    var video: Video?
    
    let sampleDesc = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
    veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip
    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
    dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """
    var segmentedControlClosure: IntClosure?
    
    lazy var aboutUsCellModel = BrandDescriptionCellModel(title: "About us",
                                                          description: sampleDesc,
                                                          numberOfDescLines: 5,
                                                          isShowSeperatorLine: false)
    
    lazy var segmentCellModel = SegmentedControlCellModel(titles: ["Info", "Categories"], selectedIndex: segmentSelectedIndex)
    
    lazy var categoriesCellModel = BrandCategoryCellModel(categories: categories, title: "Our Categories")
    
    func getCategories(completion: @escaping VoidClosure) {
        let request = CategoryRequest()
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
                self.categories = data
                for category in self.categories {
                    category.isSelected = false
                    category.iconWhite = CategoriesHelper.shared.getCategoryIcon(categoryType: CategoryType(rawValue: category.title) ?? .fashion, isWhite: true)
                    category.icon = CategoriesHelper.shared.getCategoryIcon(categoryType: CategoryType(rawValue: category.title) ?? .fashion, isWhite: false)
                }
                completion()
            case .failure(let error):
                self.router.presentAlert(title: error.message ?? "Some thing went wrong!", buttonTitle: "Close")
            }
        }
    }
    
}
