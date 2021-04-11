//
//  LoginViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import Foundation
import UIKit

protocol LoginViewDataSource {}

protocol LoginViewEventSource {
    func loginButtonAction(email: String, password: String)
    func registerButtonAction()
    func forgotButtonAction()
}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    func loginButtonAction(email: String, password: String) {
        let request = LoginRequest(email: email, password: password)
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
                UserDefaultsHelper.setData(value: data, key: .token)
                self.getCategories { (categories) in
                    self.router.pushHome(categories: categories ?? [])
                }
            case .failure(let error):
                self.router.presentAlert(title: error.message ?? "Some thing went wrong!", buttonTitle: "Close")
            }
        }
    }
    
    func registerButtonAction() {
        router.pushRegister()
    }
    
    func forgotButtonAction() {
        // to do
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
                let categories: [Category] = data
                for category in categories {
                    category.isSelected = false
                    category.iconWhite = CategoriesHelper.shared.getCategoryIcon(categoryType: CategoryType(rawValue: category.title) ?? .fashion, isWhite: true)
                    category.icon = CategoriesHelper.shared.getCategoryIcon(categoryType: CategoryType(rawValue: category.title) ?? .fashion, isWhite: false)
                }
                completion(data)
            case .failure(let error):
                self.router.presentAlert(title: error.message ?? "Some thing went wrong!", buttonTitle: "Close")
            }
        }
    }
}
