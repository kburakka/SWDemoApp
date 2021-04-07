//
//  MenuRoute.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import SideMenu
import UIKit

protocol MenuRoute {
    func presentMenu(from: UIViewController)
}

extension MenuRoute where Self: RouterProtocol {
    
    func presentMenu(from: UIViewController) {
        let router = MenuRouter()
        let viewModel = MenuViewModel(router: router)
        let viewController = MenuViewController(viewModel: viewModel)
        let menu = SideMenuNavigationController(rootViewController: viewController)
        menu.leftSide = true

        from.present(menu, animated: true, completion: nil)
    }
}
