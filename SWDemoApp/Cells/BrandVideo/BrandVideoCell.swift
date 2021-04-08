//
//  BrandVideoCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit

class BrandVideoCell: UITableViewCell, ReusableView {
    
    weak var viewModel: BrandVideoCellProtocol?
    
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
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = UIColor.appShaft.withAlphaComponent(0.5)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .large)
        label.textColor = .appShaft
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [dateLabel, titleLabel],
                           axis: .vertical,
                           spacing: 0,
                           alignment: .leading,
                           distribution: .fillEqually)
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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
         self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 16, left: 30, bottom: 0, right: 30))
    }
    
    private func configureContents() {
        selectionStyle = .none
        buttomView.addSubviews([infoStackView, likeButton])
        topView.addSubviews([videoImage, playButton])
        contentView.addSubviews([topView, buttomView])
        
        topView.edgesToSuperview(excluding: .bottom)
        topView.height(325)
        
        videoImage.edgesToSuperview()
        
        playButton.centerInSuperview()
        playButton.height(90)
        playButton.width(90)
        
        buttomView.height(75)
        buttomView.topToBottom(of: topView)
        buttomView.edgesToSuperview(excluding: .top)
        
        infoStackView.height(60)
        infoStackView.edgesToSuperview(excluding: [.trailing, .bottom])
        infoStackView.trailingToLeading(of: likeButton)
        
        likeButton.height(20)
        likeButton.width(20)
        likeButton.topToSuperview(offset: 30)
        likeButton.trailingToSuperview(offset: 20)
    }
    
    func set(viewModel: BrandVideoCellProtocol) {
        self.viewModel = viewModel
        if let url = URL(string: viewModel.video?.thumb ?? "") {
            videoImage.kf.setImage(with: url)
        }
        dateLabel.text = viewModel.video?.date
        titleLabel.text = viewModel.video?.title
    }
}
