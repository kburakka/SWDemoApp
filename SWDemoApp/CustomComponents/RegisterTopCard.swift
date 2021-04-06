//
//  RegisterTopCard.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

class RegisterTopCard: UIView {
    private let containerView = UIView(backgroundColor: .clear)

    private var mainCard: UIView = {
        let view = UIView(backgroundColor: .appWhite,
                          cornerRadius: 5)
        return view
    }()

    private var rightFirst: UIView = {
        let view = UIView(backgroundColor: UIColor.appWhite.withAlphaComponent(0.5),
                          cornerRadius: 5)
        view.rotate(angle: 15)
        return view
    }()
    
    private var rightSecond: UIView = {
        let view = UIView(backgroundColor: UIColor.appWhite.withAlphaComponent(0.2),
                          cornerRadius: 5)
        view.rotate(angle: 15)
        return view
    }()
    
    private var leftFirst: UIView = {
        let view = UIView(backgroundColor: UIColor.appWhite.withAlphaComponent(0.5),
                          cornerRadius: 5)
        view.rotate(angle: -15)
        return view
    }()
    
    private var leftSecond: UIView = {
        let view = UIView(backgroundColor: UIColor.appWhite.withAlphaComponent(0.2),
                          cornerRadius: 5)
        view.rotate(angle: -15)
        return view
    }()
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage.appIcon.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .appShaft
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .large)
        label.textColor = .appShaft
        label.textAlignment = .center
        label.text = "Demo"
        return label
    }()
    
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
        mainCard.addSubviews([appIconImageView, titleLabel])
        containerView.addSubviews([leftSecond, leftFirst, rightSecond, rightFirst, mainCard])
        addSubview(containerView)
    }

    func setupLayouts() {
        mainCard.topToSuperview()
        mainCard.bottomToSuperview()
        mainCard.aspectRatio(179 / 249)
        mainCard.centerInSuperview()
        
        rightFirst.trailing(to: mainCard, offset: 7)
        rightFirst.aspectRatio(179 / 249)
        rightFirst.top(to: mainCard, offset: 15)
        rightFirst.bottom(to: mainCard, offset: -15)
        
        rightSecond.trailing(to: rightFirst, offset: 20)
        rightSecond.aspectRatio(179 / 249)
        rightSecond.top(to: rightFirst, offset: 30)
        rightSecond.bottom(to: rightFirst, offset: -30)
        
        leftFirst.leading(to: mainCard, offset: -7)
        leftFirst.aspectRatio(179 / 249)
        leftFirst.top(to: mainCard, offset: 15)
        leftFirst.bottom(to: mainCard, offset: -15)
        
        leftSecond.leading(to: leftFirst, offset: -20)
        leftSecond.aspectRatio(179 / 249)
        leftSecond.top(to: rightFirst, offset: 30)
        leftSecond.bottom(to: rightFirst, offset: -30)
        
        appIconImageView.width(to: mainCard, multiplier: 0.5)
        appIconImageView.aspectRatio(1)
        appIconImageView.topToSuperview(offset: 45)
        appIconImageView.centerXToSuperview()

        titleLabel.leadingToSuperview()
        titleLabel.trailingToSuperview()
        titleLabel.topToBottom(of: appIconImageView, offset: 10)
        
        containerView.edgesToSuperview()
    }
}
