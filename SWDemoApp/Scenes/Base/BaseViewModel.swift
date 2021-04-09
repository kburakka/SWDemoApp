//
//  BaseViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import Foundation

protocol BaseViewModelDataSource: AnyObject { }

protocol BaseViewModelEventSource: AnyObject { }

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    func showLoadingView()
    func hideLoadingView()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    var router: R
    
    var dataProvider: DataProviderProtocol

    private var hud = LoadingHelper("loading")

    init(router: R, dataProvider: DataProviderProtocol = ApiProvider.shared) {
        self.router = router
        self.dataProvider = dataProvider
    }
    
    func showLoadingView() {
        hud.showHUD()
    }
    
    func hideLoadingView() {
        hud.stopHUD()
    }
}
