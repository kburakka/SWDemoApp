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
    func signUpButtonAction()
}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    func signUpButtonAction() {
        router.pushSignUp()
    }
    
    func loginButtonAction() {
        router.pushLogin()
    }
}
