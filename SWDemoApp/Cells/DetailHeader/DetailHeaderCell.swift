//
//  DetailHeaderCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import UIKit

class DetailHeaderCell: UITableViewCell, ReusableView {
    
    weak var viewModel: DetailHeaderCellProtocol?
    
    private let containerView: UIView = {
        let view = UIView(backgroundColor: UIColor.appShaft.withAlphaComponent(0.05), cornerRadius: 10)
        view.clipsToBounds = true
        view.addShadow()
        return view
    }()
    
    private let categoryIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .custom(size: 26))
        label.textColor = .appShaft
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private let videoCountLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .custom(size: 26))
        label.textColor = .appShaft
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [titleLabel, videoCountLabel],
                           axis: .vertical,
                           spacing: 0,
                           alignment: .leading,
                           distribution: .fill)
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
         self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 36, left: 30, bottom: 0, right: 30))
    }
    
    private func configureContents() {
        selectionStyle = .none
        contentView.addSubview(containerView)
        containerView.addSubviews([categoryIcon, infoStackView])
        containerView.edgesToSuperview()
        
        categoryIcon.height(40)
        categoryIcon.width(40)
        categoryIcon.centerYToSuperview()
        categoryIcon.leadingToSuperview(offset: 20)
        
        infoStackView.leadingToTrailing(of: categoryIcon, offset: 20)
        infoStackView.trailingToSuperview()
        infoStackView.centerYToSuperview()
    }
    
    func set(viewModel: DetailHeaderCellProtocol) {
        self.viewModel = viewModel
        switch viewModel.detailType {
        case .video:
            categoryIcon.image = .imgApple
            titleLabel.text = viewModel.video?.brand
            videoCountLabel.text = "22 Videos"
        case .category:
            categoryIcon.image = viewModel.category?.icon
            titleLabel.text = viewModel.category?.title
            videoCountLabel.text = "\(viewModel.category?.videoCount ?? 0) Videos"
        }
    }
}
