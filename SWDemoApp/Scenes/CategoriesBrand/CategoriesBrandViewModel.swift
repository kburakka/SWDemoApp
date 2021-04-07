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
}

protocol CategoriesBrandViewProtocol: CategoriesBrandViewDataSource, CategoriesBrandViewEventSource {}

final class CategoriesBrandViewModel: BaseViewModel<CategoriesBrandRouter>, CategoriesBrandViewProtocol {
    
    var categories: [Category] = []
    
    func backButtonAction() {
        router.close()
    }
}
