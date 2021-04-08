//
//  BrandDetailRoute.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

protocol BrandDetailRoute {
    func pushBrandDetail(video: Video?)
}

extension BrandDetailRoute where Self: RouterProtocol {
    
    func pushBrandDetail(video: Video?) {
        let router = BrandDetailRouter()
        let viewModel = BrandDetailViewModel(router: router)
        viewModel.video = video
        let viewController = BrandDetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
