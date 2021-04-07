//
//  CategoriesBrandRoute.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

protocol CategoriesBrandRoute {
    func pushCategoriesBrand(categories: [Category])
}

extension CategoriesBrandRoute where Self: RouterProtocol {
    
    func pushCategoriesBrand(categories: [Category]) {
        let router = CategoriesBrandRouter()
        let viewModel = CategoriesBrandViewModel(router: router)
        viewModel.categories = categories
        let viewController = CategoriesBrandViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
