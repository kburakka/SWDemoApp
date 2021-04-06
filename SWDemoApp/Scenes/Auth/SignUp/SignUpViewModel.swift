//
//  SignUpViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import Foundation

protocol SignUpViewDataSource {}

protocol SignUpViewEventSource {}

protocol SignUpViewProtocol: SignUpViewDataSource, SignUpViewEventSource {}

final class SignUpViewModel: BaseViewModel<SignUpRouter>, SignUpViewProtocol {
    
}
