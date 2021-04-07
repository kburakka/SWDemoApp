//
//  CategoriesBrandViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation

protocol CategoriesBrandViewDataSource {
    var categories: [Category] { get }
}

protocol CategoriesBrandViewEventSource {
    func backButtonAction()
    func categoryDetailAction(id: Int)
}

protocol CategoriesBrandViewProtocol: CategoriesBrandViewDataSource, CategoriesBrandViewEventSource {}

final class CategoriesBrandViewModel: BaseViewModel<CategoriesBrandRouter>, CategoriesBrandViewProtocol {
    
    var categories: [Category] = []
    
    func backButtonAction() {
        router.close()
    }
    
    func categoryDetailAction(id: Int) {
        if let category = categories.first(where: { $0.id == id }) {
            router.pushCategoryDetail(category: category)
        }
    }
}
