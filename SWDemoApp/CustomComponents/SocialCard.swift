//
//  SocialCard.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit

class SocialCard: UIView {

    private let containerView: UIView = {
        let view = UIView(backgroundColor: .appWhite)
        view.layer.cornerRadius = 17
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.appAlto.cgColor
        view.layer.borderWidth = 1
        view.addShadow(ofColor: .appAlto, radius: 3, offset: CGSize(width: 3, height: 3), opacity: 3)
        view.superview?.layoutIfNeeded()
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    // MARK: - Init
    convenience init(icon: UIImage, imageSize: CGSize) {
        defer {
            imageView.image = icon
            imageView.height(imageSize.height)
            imageView.width(imageSize.width)
            commonInit()
        }
        self.init()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function

    func commonInit() {
        setupViews()
        setupLayouts()
    }

    func setupViews() {
        containerView.addSubviews([imageView])
        addSubview(containerView)
    }

    func setupLayouts() {
        imageView.centerInSuperview()
        
        containerView.edgesToSuperview()
    }
}
