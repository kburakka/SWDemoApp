//
//  CategoriesViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

final class CategoriesViewController: BaseViewController<CategoriesViewModel> {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CategoryCell.self)
        collectionView.register(CategoryHeaderCell.self)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.contentInset.left = 30
        collectionView.contentInset.right = 30
        collectionView.contentInset.bottom = 120
        collectionView.delegate = self
        return collectionView
    }()
    
    private let confirmButton: BaseButton = {
        let button = BaseButton(title: "Confirm",
                                titleFont: .font(.omnesRegular, size: .medium),
                                titleColor: .appWhite)
        button.addTarget(self,
                         action: #selector(confirmAction),
                         for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCategoryCellModels { [weak self] _ in
            self?.collectionView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        confirmButton.layer.insertSublayer(CALayer().appHorizontalGradient(frame: confirmButton.bounds), at: 0)
    }
    
    override func setupViews() {
        view.backgroundColor = .appAlabaster
        view.addSubviews([collectionView, confirmButton])
    }
    
    override func setupLayouts() {
        collectionView.edgesToSuperview()
        
        confirmButton.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 30, bottom: 30, right: 30), usingSafeArea: true)
        confirmButton.height(46)
    }
}

// MARK: - UICollectionView DataSource
extension CategoriesViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return viewModel.categoryCellModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: CategoryHeaderCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.set(viewModel: viewModel.categoryHeaderModel)
            return cell
        } else {
            let cell: CategoryCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.set(viewModel: viewModel.categoryCellModels[indexPath.row])
            return cell
        }
    }
}

// MARK: - UICollectionView Delegate FlowLayout
extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width - 60, height: 110)
        } else {
            let width = (collectionView.frame.width - 90) / 2
            let height = 180 * width / 140
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 20, left: 40, bottom: 0, right: 40)
        } else {
            return UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        }
    }
}

// MARK: - UICollectionViewDelegate
extension CategoriesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(index: indexPath.row)
    }
}

// MARK: - Action
@objc
extension CategoriesViewController {
    func confirmAction() {
        if viewModel.categories.contains(where: { $0.isSelected == true }) {
            viewModel.comfirmButtonAction()
        } else {
            showAlert(title: "Warning", message: "Please select at least 1 category")
        }
    }
}
