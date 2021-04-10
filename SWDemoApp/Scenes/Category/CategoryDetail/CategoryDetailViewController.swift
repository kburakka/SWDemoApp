//
//  CategoryDetailViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import UIKit

final class CategoryDetailViewController: BaseViewController<CategoryDetailViewModel> {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.register(DetailHeaderCell.self)
        tableView.register(CategoryVideoCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    enum Section: Int, CaseIterable {
        case header
        case video
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appWhite
        navigationItem.title = viewModel.category?.title
        viewModel.getVideos { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func setupViews() {
        view.addSubview(tableView)
    }
    
    override func setupLayouts() {
        tableView.edgesToSuperview(excluding: .bottom)
        tableView.bottomToSuperview(offset: -30)
    }
}

extension CategoryDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .header:
            return 1
        case .video:
            return viewModel.videos.count
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section) {
        case .header:
            let cell: DetailHeaderCell = tableView.dequeueReusableCell(for: indexPath)
            let viewModel = DetailHeaderCellModel(category: self.viewModel.category, detailType: .category)
            cell.set(viewModel: viewModel)
            return cell
        case .video:
            let cell: CategoryVideoCell = tableView.dequeueReusableCell(for: indexPath)
            let viewModel = CategoryVideoCellModel(video: self.viewModel.videos[indexPath.row])
            cell.set(viewModel: viewModel)
            return cell
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Section(rawValue: indexPath.section) {
        case .header:
            return 130
        case .video:
            return 185
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Section(rawValue: indexPath.section) {
        case .header:
            break
        case .video:
            viewModel.videoTapAction(video: viewModel.videos[indexPath.row])
        case .none:
            break
        }
    }
}
