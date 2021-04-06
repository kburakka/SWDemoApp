//
//  RegisterViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import Foundation

protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {
    func loginButtonAction()
}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    func loginButtonAction() {
        router.pushLogin()
    }
}
