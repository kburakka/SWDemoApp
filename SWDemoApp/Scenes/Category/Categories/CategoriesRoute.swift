//
//  CategoriesRoute.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

protocol CategoriesRoute {
    func pushCategories(name: String)
}

extension CategoriesRoute where Self: RouterProtocol {
    
    func pushCategories(name: String) {
        let router = CategoriesRouter()
        let viewModel = CategoriesViewModel(router: router)
        viewModel.name = name
        let viewController = CategoriesViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
