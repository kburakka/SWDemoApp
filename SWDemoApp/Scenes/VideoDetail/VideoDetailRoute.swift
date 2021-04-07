//
//  VideoDetailRoute.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

protocol VideoDetailRoute {
    func pushVideoDetail(category: Category?, video: Video?)
}

extension VideoDetailRoute where Self: RouterProtocol {
    
    func pushVideoDetail(category: Category?, video: Video?) {
        let router = VideoDetailRouter()
        let viewModel = VideoDetailViewModel(router: router)
        viewModel.category = category
        viewModel.video = video
        let viewController = VideoDetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
