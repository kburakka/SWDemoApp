//
//  CategoriesViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import Foundation
import UIKit

protocol CategoriesViewDataSource {
    var categories: [Category] { get }
    var categoryHeaderModel: CategoryHeaderCellModel { get }
    var categoryCellModels: [CategoryCellModel] { get }
    var name: String { get }

    func getCategories(completion: @escaping (([Category]?) -> Void))
    func getCategoryCellModels(completion:@escaping (([CategoryCellModel]) -> Void))
}

protocol CategoriesViewEventSource {
    func comfirmButtonAction()
    func didSelectItemAt(index: Int)
}

protocol CategoriesViewProtocol: CategoriesViewDataSource, CategoriesViewEventSource {}

final class CategoriesViewModel: BaseViewModel<CategoriesRouter>, CategoriesViewProtocol {
    var name: String = ""

    var categories: [Category] = []

    var categoryCellModels: [CategoryCellModel] = []
    
    lazy var categoryHeaderModel = CategoryHeaderCellModel(name: name)
    
    func didSelectItemAt(index: Int) {
        categoryCellModels[index].category.isSelected?.toggle()
        categories.first(where: { $0.id == categoryCellModels[index].category.id })?.isSelected?.toggle()
        categoryCellModels[index].tapButtonAction()
    }
    
    func comfirmButtonAction() {
        let selectedIds = categories.filter({ $0.isSelected == true }).map({ $0.id })
        UserDefaultsHelper.setData(value: selectedIds, key: .selectedCategories)
        router.pushHome(categories: categories)
    }
    
    func getCategoryCellModels(completion: @escaping (([CategoryCellModel]) -> Void)) {
        getCategories { (categories) in
            var categoryCellModels: [CategoryCellModel] = []
            if let categories = categories {
                for category in categories {
                    categoryCellModels.append(CategoryCellModel(category: category))
                }
            }
            self.categoryCellModels = categoryCellModels
            completion(categoryCellModels)
        }
    }
    
    func getCategories(completion: @escaping (([Category]?) -> Void)) {
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
                completion(self.categories)
            case .failure(let error):
                self.router.presentAlert(title: error.message ?? "Some thing went wrong!", buttonTitle: "Close")
            }
        }
    }
}
