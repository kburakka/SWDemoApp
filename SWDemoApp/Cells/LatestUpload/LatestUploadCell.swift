//
//  LatestUploadCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import UIKit
import Kingfisher

class LatestUploadCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: LatestUploadCellProtocol?

    private var topView: UIView = {
        let view = UIView(backgroundColor: .clear,
                          cornerRadius: 5)
        return view
    }()
    
    private let videoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = .imgVideoImage
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setBackgroundImage(.imgPlay, for: .normal)
        return button
    }()
    
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = UIColor.appShaft.withAlphaComponent(0.5)
        label.textAlignment = .center
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .medium)
        label.textColor = .appShaft
        label.textAlignment = .center
        label.numberOfLines = 0
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
        topView.addSubviews([videoImage, playButton])
        contentView.addSubviews([topView, brandLabel, titleLabel])
        
        videoImage.edgesToSuperview()
        
        topView.leadingToSuperview()
        topView.trailingToSuperview()
        topView.topToSuperview()
        topView.height(190)
        
        playButton.centerInSuperview()
        playButton.height(70)
        playButton.width(70)
        
        brandLabel.height(15)
        brandLabel.leadingToSuperview()
        brandLabel.trailingToSuperview()
        brandLabel.topToBottom(of: topView, offset: 8)
        
        titleLabel.leadingToSuperview()
        titleLabel.trailingToSuperview()
        titleLabel.topToBottom(of: brandLabel, offset: 8)
        titleLabel.bottomToSuperview()
    }
    
    func set(viewModel: LatestUploadCellProtocol) {
        self.viewModel = viewModel
        videoImage.kf.setImage(with: URL(string: viewModel.thumb))
        brandLabel.text = viewModel.brand
        titleLabel.text = viewModel.title
    }
}
