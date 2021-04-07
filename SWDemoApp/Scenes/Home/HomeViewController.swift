//
//  HomeViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit
import SideMenu
import AVFoundation
import AVKit

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
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.register(LatestUploadCell.self)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
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
        view.addSubviews([searchBar, notificationButton, collectionView])
    }
    
    override func setupLayouts() {
        searchBar.leadingToSuperview(offset: 5)
        searchBar.topToSuperview(offset: 22, usingSafeArea: true)
        searchBar.height(50)
        
        notificationButton.leadingToTrailing(of: searchBar)
        notificationButton.trailingToSuperview(offset: 20)
        notificationButton.topToSuperview(offset: 24, usingSafeArea: true)
        notificationButton.height(46)
        notificationButton.width(46)
        
        collectionView.topToBottom(of: searchBar, offset: 30)
        collectionView.leadingToSuperview()
        collectionView.trailingToSuperview()
        collectionView.height(260)
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

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.latestUploadModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LatestUploadCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.latestUploadModels[indexPath.row])
        cell.playButton.tag = indexPath.row
        cell.playButton.addTarget(self,
                                  action: #selector(playButtonAction),
                                  for: .touchUpInside)
        return cell
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
}

// MARK: - Action
@objc
private extension HomeViewController {
    func playButtonAction(sender: UIButton) {
        if let url = URL(string: viewModel.latestUploadModels[sender.tag].url) {
            playVideo(url: url)
        }
    }
}

// MARK: - Helper
private extension HomeViewController {
    func playVideo(url: URL) {
        let player = AVPlayer(url: url)
        
        let avpController = AVPlayerViewController()
        avpController.player = player
        
        self.present(avpController, animated: true) {
            avpController.player?.play()
        }
    }
}
