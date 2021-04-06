//
//  SignUpRoute.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

protocol SignUpRoute {
    func pushSignUp()
}

extension SignUpRoute where Self: RouterProtocol {
    
    func pushSignUp() {
        let router = SignUpRouter()
        let viewModel = SignUpViewModel(router: router)
        let viewController = SignUpViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
