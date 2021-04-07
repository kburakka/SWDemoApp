//
//  CategoryVideoCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import UIKit

class CategoryVideoCell: UITableViewCell, ReusableView {
    
    weak var viewModel: CategoryVideoCellProtocol?
    
    private var topView: UIView = {
        let view = UIView(backgroundColor: .clear,
                          cornerRadius: 10)
        return view
    }()
    
    private var buttomView: UIView = {
        let view = UIView(backgroundColor: .clear,
                          cornerRadius: 10)
        return view
    }()
    
    private let videoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setBackgroundImage(.imgPlay, for: .normal)
        return button
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .custom(size: 12))
        label.textColor = UIColor.appShaft.withAlphaComponent(0.5)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .custom(size: 14))
        label.textColor = .appShaft
        return label
    }()
    
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .custom(size: 12))
        label.textColor = .appShaft
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [dateLabel, titleLabel, brandLabel],
                           axis: .vertical,
                           spacing: 0,
                           alignment: .leading,
                           distribution: .equalSpacing)
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.imgLike, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
         self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 36, left: 30, bottom: 0, right: 30))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    private func configureContents() {
        buttomView.addSubviews([infoStackView, likeButton])
        topView.addSubviews([videoImage, playButton])
        contentView.addSubviews([topView, buttomView])
        
        topView.edgesToSuperview(excluding: .bottom)
        topView.height(100)
        
        videoImage.edgesToSuperview()
        
        playButton.centerYToSuperview()
        playButton.leadingToSuperview(offset: 20)
        playButton.height(46)
        playButton.width(46)
        
        buttomView.height(55)
        buttomView.topToBottom(of: topView)
        buttomView.edgesToSuperview(excluding: .top)
        
        infoStackView.edgesToSuperview(excluding: .trailing)
        infoStackView.trailingToLeading(of: likeButton)
        
        likeButton.height(20)
        likeButton.width(20)
        likeButton.centerYToSuperview()
        likeButton.trailingToSuperview(offset: 30)
    }
    
    func set(viewModel: CategoryVideoCellProtocol) {
        self.viewModel = viewModel
        if let url = URL(string: viewModel.video?.thumb ?? "") {
            videoImage.kf.setImage(with: url)
        }
        brandLabel.text = viewModel.video?.brand
        dateLabel.text = viewModel.video?.date
        titleLabel.text = viewModel.video?.title
    }
}
