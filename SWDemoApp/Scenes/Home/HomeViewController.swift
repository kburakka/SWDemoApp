//
//  HomeViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit
import SideMenu

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavItems()
    }
    
    override func setupViews() {
        view.backgroundColor = .appWhite

    }
    
    override func setupLayouts() {
        
    }
    
    func setupNavItems() {
        navigationItem.title = "Home"
        let hamburgerItem = UIBarButtonItem(image: UIImage.imgHamburger.resize(targetSize: CGSize(width: 25, height: 22)),
                                            style: .plain,
                                            target: self,
                                            action: #selector(presentSideMenu))
        navigationItem.leftBarButtonItem = hamburgerItem
        
        let appItem = UIBarButtonItem(image: UIImage.appIconNav.resize(targetSize: CGSize(width: 32, height: 32)),
                                      style: .plain,
                                      target: self,
                                      action: nil)
        navigationItem.rightBarButtonItem = appItem
    }
}

// MARK: - Action
@objc
extension HomeViewController {
    func presentSideMenu() {
        viewModel.leftItemAction(from: self)
    }
}
