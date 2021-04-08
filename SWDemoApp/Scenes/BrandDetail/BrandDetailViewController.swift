//
//  BrandDetailViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit

final class BrandDetailViewController: BaseViewController<BrandDetailViewModel> {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(DetailHeaderCell.self)
        tableView.register(ChatCell.self)
        tableView.register(BrandDescriptionCell.self)
        tableView.register(SegmentedControlCell.self)
        tableView.register(ContactInfoCell.self)
        tableView.register(BrandCategoryCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        return tableView
    }()
        
    enum Section: Int, CaseIterable {
        case header
        case chat
        case segmentedControl
        case aboutUs
        case contact
        case categories
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appWhite
        navigationItem.title = viewModel.video?.brand
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
        tableView.edgesToSuperview()
    }
}

extension BrandDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .header:
            return 1
        case .chat:
            return 1
        case .segmentedControl:
            return 1
        case .aboutUs:
            return viewModel.segmentSelectedIndex == 0 ? 1 : 0
        case .contact:
            return viewModel.segmentSelectedIndex == 0 ? 1 : 0
        case .categories:
            return viewModel.segmentSelectedIndex == 1 ? 1 : 0
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section) {
        case .header:
            let cell: DetailHeaderCell = tableView.dequeueReusableCell(for: indexPath)
            let viewModel = DetailHeaderCellModel(video: self.viewModel.video, detailType: .video)
            cell.set(viewModel: viewModel)
            return cell
        case .chat:
            let cell: ChatCell = tableView.dequeueReusableCell(for: indexPath)
            let viewModel = ChatCellModel()
            cell.set(viewModel: viewModel)
            return cell
        case .segmentedControl:
            let cell: SegmentedControlCell = tableView.dequeueReusableCell(for: indexPath)
            let viewModel = self.viewModel.segmentCellModel
            viewModel.segmentedControlClosure = { index in
                viewModel.selectedIndex = index
                self.viewModel.segmentSelectedIndex = index
                tableView.reloadData()
            }
            cell.set(viewModel: viewModel)
            return cell
        case .aboutUs:
            let cell: BrandDescriptionCell = tableView.dequeueReusableCell(for: indexPath)
            let viewModel = self.viewModel.aboutUsCellModel
            cell.set(viewModel: viewModel)
            return cell
        case .contact:
            let cell: ContactInfoCell = tableView.dequeueReusableCell(for: indexPath)
            let viewModel = ContactInfoCellModel(title: "Contact Info")
            cell.set(viewModel: viewModel)
            return cell
        case .categories:
            let cell: BrandCategoryCell = tableView.dequeueReusableCell(for: indexPath)
            let viewModel = self.viewModel.categoriesCellModel
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
        case .chat:
            return 105
        case .segmentedControl:
            return 70
        case .aboutUs:
            return UITableView.automaticDimension
        case .contact:
            return 210
        case .categories:
            return UITableView.automaticDimension
        case .none:
            return 0
        }
    }
}
