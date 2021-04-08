//
//  ClickCard.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit

class ClickCard: UIView {

    private let containerView: UIView = {
        let view = UIView(backgroundColor: .appAlto,
                          cornerRadius: 10)
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = .appShaft
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Init
    convenience init(icon: UIImage, title: String) {
        defer {
            imageView.image = icon
            titleLabel.text = title
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
        containerView.addSubviews([imageView, titleLabel])
        addSubview(containerView)
    }

    func setupLayouts() {
        imageView.height(30)
        imageView.width(30)
        imageView.centerXToSuperview()
        imageView.topToSuperview(offset: 7)
        
        titleLabel.leadingToSuperview()
        titleLabel.trailingToSuperview()
        titleLabel.topToBottom(of: imageView, offset: 3)

        containerView.edgesToSuperview()
    }
}
