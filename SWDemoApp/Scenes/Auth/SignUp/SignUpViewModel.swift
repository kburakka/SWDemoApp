//
//  SignUpViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import Foundation

protocol SignUpViewDataSource {}

protocol SignUpViewEventSource {
    func continueButtonAction(register: Register)
}

protocol SignUpViewProtocol: SignUpViewDataSource, SignUpViewEventSource {}

final class SignUpViewModel: BaseViewModel<SignUpRouter>, SignUpViewProtocol {
    func continueButtonAction(register: Register) {
        let request = RegisterRequest(register: register)
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
                self.router.pushCategories()
            case .failure(let error):
                self.router.presentAlert(title: error.message ?? "Some thing went wrong!", buttonTitle: "Close")
            }
        }
    }
}
