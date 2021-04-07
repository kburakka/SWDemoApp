//
//  HomeViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit
import SideMenu

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let transparentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appShaft.withAlphaComponent(0.5)
        return view
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Searching for a specific brand?"
        searchBar.searchTextField.leftView = nil
        searchBar.sizeToFit()
        searchBar.searchTextField.backgroundColor = UIColor.appAlto.withAlphaComponent(0.3)
        searchBar.searchTextField.font = .font(.omnesRegular, size: .medium)
        searchBar.searchTextField.layer.cornerRadius = 23
        searchBar.searchTextField.clipsToBounds = true
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextPositionAdjustment = UIOffset(horizontal: 5, vertical: 0)

        return searchBar
    }()

    private let notificationButton: UIButton = {
        let button = UIButton(backgroundColor: UIColor.appAlto.withAlphaComponent(0.3), cornerRadius: 23)
        button.setImage(UIImage.imgBell.resize(targetSize: CGSize(width: 14, height: 18)), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavItems()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.setRightImage(image: UIImage.imgSearch.resize(targetSize: CGSize(width: 12, height: 12)))

    }
    override func setupViews() {
        view.backgroundColor = .appWhite
        view.addSubviews([searchBar, notificationButton])
    }
    
    override func setupLayouts() {
        searchBar.leadingToSuperview(offset: 5)
        searchBar.topToSuperview(offset: 24, usingSafeArea: true)
        searchBar.height(46)
        
        notificationButton.leadingToTrailing(of: searchBar)
        notificationButton.trailingToSuperview(offset: 20)
        notificationButton.topToSuperview(offset: 24, usingSafeArea: true)
        notificationButton.height(46)
        notificationButton.width(46)

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

extension HomeViewController: SideMenuNavigationControllerDelegate {
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        view.addSubview(transparentView)
        transparentView.edgesToSuperview()
    }

    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        transparentView.removeFromSuperview()
    }
}
extension UISearchBar {
    public var textField: UITextField? {
        return searchTextField
    }
    
    func setRightImage(image: UIImage) {
        showsBookmarkButton = true
        if let btn = textField?.rightView as? UIButton {
            btn.setImage(image,
                         for: .normal)
        }
    }
}
