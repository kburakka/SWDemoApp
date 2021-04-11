//
//  CategoryHeaderCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

class CategoryHeaderCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: CategoryHeaderCellProtocol?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        contentView.addSubview(titleLabel)
        titleLabel.edgesToSuperview()
    }
    
    func set(viewModel: CategoryHeaderCellProtocol) {
        self.viewModel = viewModel
        titleLabel.attributedText = viewModel.title
    }
}
