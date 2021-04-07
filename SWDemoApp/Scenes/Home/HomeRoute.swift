//
//  HomeRoute.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

protocol HomeRoute {
    func pushHome(categories: [Category])
}

extension HomeRoute where Self: RouterProtocol {
    
    func pushHome(categories: [Category]) {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router)
        viewModel.categories = categories
        let viewController = HomeViewController(viewModel: viewModel)
        let navigationController = BaseNavigationController(rootViewController: viewController)

        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
