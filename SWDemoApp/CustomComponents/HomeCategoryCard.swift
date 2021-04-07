//
//  HomeCategoryCard.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import UIKit

class HomeCategoryCard: UIView {

    private let containerView: UIView = {
        let view = UIView(backgroundColor: .clear,
                          cornerRadius: 10)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.appShaft.cgColor
        view.addShadow(ofColor: .appAlto, radius: 3, offset: CGSize(width: 3, height: 3), opacity: 0.3)
        return view
    }()
    
    private let categoryIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .medium)
        label.textColor = .appShaft
        return label
    }()
    
    // MARK: - Init
    convenience init(viewModel: CategoryCellModel) {
        defer {
            categoryIconImageView.image = viewModel.icon
            titleLabel.text = viewModel.title
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
        containerView.addSubviews([categoryIconImageView, titleLabel])
        addSubview(containerView)
    }

    func setupLayouts() {
        
        categoryIconImageView.leadingToSuperview(offset: 20)
        categoryIconImageView.centerYToSuperview()
        categoryIconImageView.height(30)
        categoryIconImageView.width(30)
        
        titleLabel.leadingToTrailing(of: categoryIconImageView, offset: 20)
        titleLabel.edgesToSuperview(excluding: .leading)

        containerView.edgesToSuperview()
    }
}
