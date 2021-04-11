//
//  AlertRoute.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 11.04.2021.
//

protocol AlertRoute {
    func presentAlert(title: String, buttonTitle: String)
}

extension AlertRoute where Self: RouterProtocol {
    
    func presentAlert(title: String, buttonTitle: String) {
        let router = AlertRouter()
        let viewModel = AlertViewModel(router: router)
        viewModel.title = title
        viewModel.buttonTitle = buttonTitle
        let viewController = AlertViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        transition.modalPresentationStyle = .overFullScreen
        transition.modalTransitionStyle = .crossDissolve
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
