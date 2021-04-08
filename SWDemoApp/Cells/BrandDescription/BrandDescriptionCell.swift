//
//  BrandDescriptionCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit

class BrandDescriptionCell: UITableViewCell, ReusableView {
    
    weak var viewModel: BrandDescriptionCellProtocol?
    
    private var seperetorLine: UIView = {
        let view = UIView(backgroundColor: UIColor.appShaft.withAlphaComponent(0.5))
        return view
    }()
    
    private let containerView = UIView()
    
    private let showMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show more", for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.setImage(UIImage.imgDownArrow.resize(targetSize: CGSize(width: 9, height: 6)), for: .normal)
        button.setTitleColor(.appShaft, for: .normal)
        button.titleLabel?.font = .font(.omnesSemiBold, size: .medium)
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .large)
        label.textColor = .appShaft
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = .appShaft
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    private func configureContents() {
        selectionStyle = .none
        containerView.addSubviews([titleLabel, descriptionLabel, showMoreButton])
        contentView.addSubviews([seperetorLine, containerView])
        seperetorLine.height(1)
        seperetorLine.edgesToSuperview(excluding: .bottom)
        
        containerView.leadingToSuperview(offset: 30)
        containerView.trailingToSuperview(offset: 30)
        containerView.topToBottom(of: seperetorLine, offset: 10)
        containerView.bottomToSuperview(offset: -10)
        
        titleLabel.edgesToSuperview(excluding: .bottom)
        titleLabel.height(24)
        
        descriptionLabel.leadingToSuperview()
        descriptionLabel.trailingToSuperview()
        descriptionLabel.topToBottom(of: titleLabel, offset: 5)
        
        showMoreButton.topToBottom(of: descriptionLabel, offset: 5)
        showMoreButton.trailingToSuperview()
        showMoreButton.bottomToSuperview()
        showMoreButton.height(18)

    }
    
    func set(viewModel: BrandDescriptionCellProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        descriptionLabel.numberOfLines = viewModel.numberOfDescLines ?? 0
    }
}
