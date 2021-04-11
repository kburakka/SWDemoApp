//
//  MenuViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import UIKit

final class MenuViewController: BaseViewController<MenuViewModel> {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(MenuCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = false
        return tableView
    }()
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage.appIcon.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .appShaft
        return imageView
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms & Conditions", for: .normal)
        button.setTitleColor(UIColor.appShaft.withAlphaComponent(0.5), for: .normal)
        button.titleLabel?.font = .font(.omnesRegular, size: .large)
        button.backgroundColor = .clear
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.appWhite, for: .normal)
        button.titleLabel?.font = .font(.omnesRegular, size: .large)
        button.backgroundColor = UIColor.appShaft.withAlphaComponent(0.5)
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        button.addTarget(self,
                         action: #selector(logoutAction),
                         for: .touchUpInside)
        return button
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.imgClose, for: .normal)
        button.addTarget(self,
                         action: #selector(closeAction),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appWhite
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func setupViews() {
        view.addSubviews([appIconImageView, tableView, termsButton, logoutButton, closeButton])
    }
    
    override func setupLayouts() {
        closeButton.height(18)
        closeButton.width(18)
        closeButton.topToSuperview(offset: 15, usingSafeArea: true)
        closeButton.trailingToSuperview(offset: 15)
        
        appIconImageView.height(120)
        appIconImageView.width(120)
        appIconImageView.topToSuperview(offset: 60)
        appIconImageView.leadingToSuperview(offset: 30)
        
        tableView.topToBottom(of: appIconImageView, offset: 30)
        tableView.leadingToSuperview(offset: 30)
        tableView.trailingToSuperview()
        
        termsButton.height(60)
        termsButton.leadingToSuperview(offset: 30)
        termsButton.trailingToSuperview()
        termsButton.topToBottom(of: tableView, offset: 30)

        logoutButton.height(60)
        logoutButton.topToBottom(of: termsButton)
        logoutButton.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuItemModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.menuItemModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

// MARK: - Action
@objc
extension MenuViewController {
    func closeAction() {
        dismiss(animated: true, completion: nil)
    }
    
    func logoutAction() {
        viewModel.logoutAction()
    }
}
