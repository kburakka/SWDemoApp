//
//  ContactInfoCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit

class ContactInfoCell: UITableViewCell, ReusableView {
    
    weak var viewModel: ContactInfoCellProtocol?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .large)
        label.textColor = .appShaft
        return label
    }()
    
    let facebook = SocialCard(icon: .imgFacebook, imageSize: CGSize(width: 7, height: 14))
    let instagram = SocialCard(icon: .imgInstagram, imageSize: CGSize(width: 14, height: 14))
    let youtube = SocialCard(icon: .imgYoutube, imageSize: CGSize(width: 18, height: 14))

    private lazy var socialStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [facebook, instagram, youtube],
                           axis: .horizontal,
                           spacing: 30,
                           alignment: .leading,
                           distribution: .fillEqually)
    }()
    
    private lazy var contactInfoStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [mailStackView, webSiteStackView],
                           axis: .vertical,
                           spacing: 10,
                           alignment: .leading,
                           distribution: .equalCentering)
    }()
    
    private let mailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = .imgArroba
        return imageView
    }()
    
    private let mailLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = .appShaft
        label.text = "apple-support@info.com"
        return label
    }()
    
    private lazy var mailStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [mailImage, mailLabel],
                           axis: .horizontal,
                           spacing: 10,
                           alignment: .leading,
                           distribution: .fillProportionally)
    }()
    
    private let webImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = .imgInternet
        return imageView
    }()
    
    private let webLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = .appShaft
        label.text = "apple.com"
        return label
    }()
    
    private lazy var webSiteStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [webImage, webLabel],
                           axis: .horizontal,
                           spacing: 10,
                           alignment: .leading,
                           distribution: .fillProportionally)
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
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30))
    }
    
    private func configureContents() {
        selectionStyle = .none
        contentView.addSubviews([titleLabel, socialStackView, contactInfoStackView])
        
        titleLabel.edgesToSuperview(excluding: .bottom)
        titleLabel.height(24)

        facebook.height(34)
        facebook.width(34)
        instagram.height(34)
        instagram.width(34)
        youtube.height(34)
        youtube.width(34)
        
        socialStackView.topToBottom(of: titleLabel, offset: 15)
        socialStackView.leadingToSuperview()
        
        mailImage.height(20)
        mailImage.width(20)
        mailLabel.height(20)
        
        webImage.height(20)
        webImage.width(20)
        webLabel.height(20)
        
        contactInfoStackView.topToBottom(of: socialStackView, offset: 25)
        contactInfoStackView.leadingToSuperview()
        contactInfoStackView.bottomToSuperview()
        contactInfoStackView.trailingToSuperview()
        contactInfoStackView.height(50)
    }
    
    func set(viewModel: ContactInfoCellProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
    }
}
