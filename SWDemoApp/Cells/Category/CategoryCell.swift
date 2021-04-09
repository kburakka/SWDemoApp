//
//  CategoryCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit
import TinyConstraints

class CategoryCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: CategoryCellProtocol?
    
    private let containerView = UIView(backgroundColor: .appConcrete, cornerRadius: 10)
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .medium)
        label.textColor = .appShaft
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
        contentView.addSubviews([containerView, titleLabel])
        containerView.addSubview(appIconImageView)
        containerView.edgesToSuperview(excluding: .bottom)
        containerView.aspectRatio(1)
        
        titleLabel.edgesToSuperview(excluding: .top)
        titleLabel.topToBottom(of: containerView, offset: 10)
        titleLabel.height(20)
        appIconImageView.edgesToSuperview(insets: .init(top: 45, left: 45, bottom: 45, right: 45))
    }
    
    func set(viewModel: CategoryCellProtocol) {
        self.viewModel = viewModel
        appIconImageView.image = viewModel.category.icon
        titleLabel.text = viewModel.category.title
        viewModel.tapClosure = {
            if viewModel.category.isSelected {
                self.containerView.layer.borderWidth = 3
                self.containerView.layer.borderColor = UIColor.appCyan.cgColor
            } else {
                self.containerView.layer.borderWidth = 0
                self.containerView.layer.borderColor = nil
            }
        }
    }
}
