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
        tableView.register(MenuCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appFuchsia
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func setupViews() {
        view.addSubviews([tableView])
    }
    
    override func setupLayouts() {
        tableView.edgesToSuperview()
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = MenuCellModel(title: viewModel.menuItems[indexPath.row])
        let cell: MenuCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: cellModel)
        return cell
    }
}
