//
//  VideoDetailViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit

final class VideoDetailViewController: BaseViewController<VideoDetailViewModel> {
   
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(DetailHeaderCell.self)
        tableView.register(BrandVideoCell.self)
        tableView.register(BrandDescriptionCell.self)
        tableView.register(ClickToCell.self)
        tableView.register(AccountDetailsCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    enum Section: Int, CaseIterable {
        case header
        case video
        case description
        case features
        case clickto
        case accountDetails
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appWhite
        navigationItem.title = viewModel.video?.brand
    }
    
    override func setupViews() {
        view.addSubview(tableView)
    }
    
    override func setupLayouts() {
        tableView.edgesToSuperview()
    }
}

extension VideoDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .header:
            return 1
        case .video:
            return 1
        case .description:
            return 1
        case .features:
            return 1
        case .clickto:
            return 1
        case .accountDetails:
            return 1
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
        case .video:
            let cell: BrandVideoCell = tableView.dequeueReusableCell(for: indexPath)
            cell.playButton.addTarget(self,
                                      action: #selector(playAction),
                                      for: .touchUpInside)
            let viewModel = BrandVideoCellModel(video: self.viewModel.video)
            cell.set(viewModel: viewModel)
            return cell
        case .description:
            let cell: BrandDescriptionCell = tableView.dequeueReusableCell(for: indexPath)
            let viewModel = self.viewModel.descriptionCellModel
            cell.set(viewModel: viewModel)
            return cell
        case .features:
            let cell: BrandDescriptionCell = tableView.dequeueReusableCell(for: indexPath)
            let viewModel = self.viewModel.featuresCellModel
            cell.set(viewModel: viewModel)
            return cell
        case .clickto:
            let cell: ClickToCell = tableView.dequeueReusableCell(for: indexPath)
            let viewModel = self.viewModel.clickCellModel
            cell.set(viewModel: viewModel)
            return cell
        case .accountDetails:
            let cell: AccountDetailsCell = tableView.dequeueReusableCell(for: indexPath)
            cell.detailButton.addTarget(self,
                                        action: #selector(detailAction),
                                        for: .touchUpInside)
            let viewModel = self.viewModel.accountDetailsCellModel
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
            return 416
        case .clickto:
            return 130
        case .description:
            return UITableView.automaticDimension
        case .features:
            return UITableView.automaticDimension
        case .accountDetails:
            return 106
        case .none:
            return 130
        }
    }
}

// MARK: - Action
@objc
extension VideoDetailViewController {
    func detailAction() {
        viewModel.accountDetailsTapAction()
    }
    
    func playAction() {
        if let url = URL(string: viewModel.video?.url ?? "") {
            playVideo(url: url)
        }
    }
}
