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
    
    init(router: R) {
        self.router = router
    }
    
    func showLoadingView() {
        // TO DO
    }
    
    func hideLoadingView() {
        // TO DO
    }
}
