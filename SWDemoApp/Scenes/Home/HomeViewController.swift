//
//  HomeViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit
import SideMenu

final class HomeViewController: BaseViewController<HomeViewModel> {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let containerView = UIView()
    
    private let latestUploadView = UIView()
    
    private let fountCategoriesView = UIView()

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
    
    private let latestUploadLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .large)
        label.textColor = .appShaft
        label.text = "Latest uploads"
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(LatestUploadCell.self)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private let fountCategoriesLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .large)
        label.textColor = .appShaft
        label.text = "My Fount Categories"
        return label
    }()
    
    private lazy var categoriesStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [],
                           axis: .vertical,
                           spacing: 15,
                           alignment: .fill,
                           distribution: .fillEqually)
    }()
    
    private let showMoreButton: BaseButton = {
        let button = BaseButton(title: "Show more",
                                titleFont: .font(.omnesRegular, size: .medium),
                                titleColor: .appWhite)
        button.addTarget(self,
                         action: #selector(showMoreAction),
                         for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavItems()
        setCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.setRightImage(image: UIImage.imgSearch.resize(targetSize: CGSize(width: 12, height: 12)))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        showMoreButton.layer.insertSublayer(CALayer().appHorizontalGradient(frame: showMoreButton.bounds), at: 0)
    }
    
    override func setupViews() {
        view.backgroundColor = .appWhite
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        latestUploadView.addSubviews([latestUploadLabel, collectionView])
        fountCategoriesView.addSubviews([fountCategoriesLabel, categoriesStackView, showMoreButton])
        containerView.addSubviews([searchBar, notificationButton, latestUploadView, fountCategoriesView])
    }
    
    override func setupLayouts() {
        scrollView.edgesToSuperview(usingSafeArea: true)
        containerView.edgesToSuperview()
        containerView.widthToSuperview()
        
        searchBar.leadingToSuperview(offset: 5)
        searchBar.topToSuperview(offset: 22, usingSafeArea: true)
        searchBar.height(50)
        
        notificationButton.leadingToTrailing(of: searchBar)
        notificationButton.trailingToSuperview(offset: 20)
        notificationButton.topToSuperview(offset: 24, usingSafeArea: true)
        notificationButton.height(46)
        notificationButton.width(46)
        
        latestUploadView.topToBottom(of: searchBar, offset: 30)
        latestUploadView.leadingToSuperview()
        latestUploadView.trailingToSuperview()
        latestUploadView.height(310)
        
        latestUploadLabel.topToSuperview()
        latestUploadLabel.leadingToSuperview(offset: 20)
        latestUploadLabel.trailingToSuperview(offset: -20)
        latestUploadLabel.height(20)
        
        collectionView.topToBottom(of: latestUploadLabel, offset: 30)
        collectionView.leadingToSuperview()
        collectionView.trailingToSuperview()
        collectionView.height(260)
        collectionView.bottomToSuperview()
        
        fountCategoriesView.topToBottom(of: latestUploadView, offset: 40)
        fountCategoriesView.leadingToSuperview()
        fountCategoriesView.trailingToSuperview()
        fountCategoriesView.bottomToSuperview(offset: -20, usingSafeArea: true)
        
        fountCategoriesLabel.topToSuperview()
        fountCategoriesLabel.leadingToSuperview(offset: 20)
        fountCategoriesLabel.trailingToSuperview(offset: -20)
        fountCategoriesLabel.height(20)
        
        categoriesStackView.topToBottom(of: fountCategoriesLabel, offset: 30)
        categoriesStackView.leadingToSuperview(offset: 20)
        categoriesStackView.trailingToSuperview(offset: 20)
        
        showMoreButton.centerXToSuperview()
        showMoreButton.height(46)
        showMoreButton.width(127)
        showMoreButton.bottomToSuperview(offset: -30)
        showMoreButton.topToBottom(of: categoriesStackView, offset: 30)

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
        if let url = URL(string: viewModel.latestUploadModels[sender.tag].video.url) {
            playVideo(url: url)
        }
    }
    
    func showMoreAction() {
        viewModel.showMoreAction()
    }
    
    func handleCategoryTap(_ sender: UITapGestureRecognizer? = nil) {
        if let tag = sender?.view?.tag {
            viewModel.categoryDetailAction(id: tag)
        }
    }
}

// MARK: - Helper
private extension HomeViewController {
    func setCategories() {
        var categoryCards: [HomeCategoryCard] = []
        
        for category in viewModel.categories.filter({ $0.isSelected == true }) {
            let categoryCard = HomeCategoryCard(viewModel: category)
            categoryCard.height(52)
            categoryCard.tag = category.id
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleCategoryTap(_:)))
            categoryCard.addGestureRecognizer(tap)
            categoryCards.append(categoryCard)
        }

        let height = (categoryCards.count * 52) + ((categoryCards.count - 1) * 15)
        categoriesStackView.height(CGFloat(height))
        categoriesStackView.addArrangedSubviews(categoryCards)
    }
}
