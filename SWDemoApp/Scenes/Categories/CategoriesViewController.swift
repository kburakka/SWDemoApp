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
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.register(CategoryCell.self)
        collectionView.register(CategoryHeaderCell.self)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.contentInset.left = 20
        collectionView.contentInset.right = 20
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
            return viewModel.categoryModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: CategoryHeaderCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.set(viewModel: viewModel.categoryHeaderModel)
            return cell
        } else {
            let cell: CategoryCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.set(viewModel: viewModel.categoryModels[indexPath.row])
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
            return CGSize(width: collectionView.frame.width - 40, height: 110)
        } else {
            return CGSize(width: 140, height: 180)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        } else {
            let cellCount = CGFloat(viewModel.categoryModels.count)

            if cellCount > 0 {
                if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
                    let cellWidth = flowLayout.itemSize.width + flowLayout.minimumInteritemSpacing

                    let totalCellWidth = cellWidth * cellCount + 20.00 * (cellCount - 1)
                    let contentWidth = collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right

                    if totalCellWidth < contentWidth {
                        let padding = (contentWidth - totalCellWidth) / 2.0
                        return UIEdgeInsets(top: 30, left: padding, bottom: 0, right: padding)
                    } else {
                        return UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20)
                    }
                }
                return UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
            }
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
        viewModel.comfirmButtonAction()
    }
}
