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
        tableView.allowsSelection = false
        tableView.register(DetailHeaderCell.self)
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .header:
            return 1
        case .video:
            return 0
        case .clickto:
            return 0
        case .description:
            return 0
        case .features:
            return 0
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
            return UITableViewCell()
        case .clickto:
            return UITableViewCell()
        case .description:
            return UITableViewCell()
        case .features:
            return UITableViewCell()
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Section(rawValue: indexPath.section) {
        case .header:
            return 130
        case .video:
            return 130
        case .clickto:
            return 130
        case .description:
            return 130
        case .features:
            return 130
        case .none:
            return 130
        }
    }
}
