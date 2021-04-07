//
//  CategoryDetailRoute.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

protocol CategoryDetailRoute {
    func pushCategoryDetail(category: Category)
}

extension CategoryDetailRoute where Self: RouterProtocol {
    
    func pushCategoryDetail(category: Category) {
        let router = CategoryDetailRouter()
        let viewModel = CategoryDetailViewModel(router: router)
        viewModel.category = category
        let viewController = CategoryDetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
