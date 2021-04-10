//
//  LoginViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import Foundation

protocol LoginViewDataSource {}

protocol LoginViewEventSource {
    func loginButtonAction(email: String, password: String)
    func registerButtonAction()
    func forgotButtonAction()
}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    func loginButtonAction(email: String, password: String) {
        // to do
        let request = TestRequest()
        dataProvider.fetchData(for: request) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }

    }
    
    func registerButtonAction() {
        router.pushRegister()
    }
    
    func forgotButtonAction() {
        // to do
    }
}
