//
//  HomeViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

protocol HomeViewDataSource {}

protocol HomeViewEventSource {
    func leftItemAction(from: UIViewController)
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    func leftItemAction(from: UIViewController) {
        router.presentMenu(from: from)
    }
}
