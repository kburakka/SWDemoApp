//
//  BrandCategoryCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit

class BrandCategoryCell: UITableViewCell, ReusableView {
    
    weak var viewModel: BrandCategoryCellProtocol?
    var categoryCards: [HomeCategoryCard] = []

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .large)
        label.textColor = .appShaft
        return label
    }()
    
    private lazy var categoriesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [],
                                    axis: .vertical,
                                    spacing: 15,
                                    alignment: .fill,
                                    distribution: .fillEqually)
        return stackView
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
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30))
    }
    
    private func configureContents() {
        selectionStyle = .none
        contentView.addSubviews([titleLabel, categoriesStackView])
        titleLabel.topToSuperview(offset: 30)
        titleLabel.edgesToSuperview(excluding: [.bottom, .top])
        titleLabel.height(24)
        categoriesStackView.edgesToSuperview(excluding: .top)
        categoriesStackView.topToBottom(of: titleLabel, offset: 15)
    }
    
    func set(viewModel: BrandCategoryCellProtocol) {
        self.viewModel = viewModel
        setCategories()
        titleLabel.text = viewModel.title
    }
    
}

// MARK: - Helper
private extension BrandCategoryCell {
    func setCategories() {
        categoriesStackView.removeAllArrangedSubviews()
        if let categories = viewModel?.categories {
            categoryCards = []
            for category in categories {
                let categoryCard = HomeCategoryCard(viewModel: category)
                categoryCard.height(52)
                categoryCards.append(categoryCard)
            }
            if !categoryCards.isEmpty {
                let height = (categoryCards.count * 52) + ((categoryCards.count - 1) * 15)
                categoriesStackView.height(CGFloat(height))
                categoriesStackView.addArrangedSubviews(categoryCards)
            }
        }
    }
}
