//
//  ClickToCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit

class ClickToCell: UITableViewCell, ReusableView {
    
    weak var viewModel: ClickToCellProtocol?
    var clickCards: [ClickCard] = []

    private var seperetorLine: UIView = {
        let view = UIView(backgroundColor: UIColor.appShaft.withAlphaComponent(0.5))
        return view
    }()
    
    private let containerView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .large)
        label.textColor = .appShaft
        return label
    }()
    
    private lazy var clicksStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [],
                           axis: .horizontal,
                           spacing: 0,
                           alignment: .leading,
                           distribution: .equalSpacing)
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    private func configureContents() {
        selectionStyle = .none
        containerView.addSubviews([titleLabel, clicksStackView])
        contentView.addSubviews([seperetorLine, containerView])
        seperetorLine.height(1)
        seperetorLine.edgesToSuperview(excluding: .bottom)
        
        containerView.leadingToSuperview(offset: 30)
        containerView.trailingToSuperview(offset: 30)
        containerView.topToBottom(of: seperetorLine, offset: 10)
        containerView.bottomToSuperview(offset: -10)
        
        titleLabel.edgesToSuperview(excluding: .bottom)
        titleLabel.height(24)
        
        clicksStackView.leadingToSuperview()
        clicksStackView.trailingToSuperview()
        clicksStackView.topToBottom(of: titleLabel, offset: 5)
        clicksStackView.bottomToSuperview()
    }
    
    func set(viewModel: ClickToCellProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        clicksStackView.removeArrangedSubviews(clickCards)
        clickCards = []
        for click in viewModel.clicks {
            let clickCard = ClickCard(icon: click.icon, title: click.title)
            clickCard.height(64)
            clickCard.width(64)
            clickCards.append(clickCard)
        }
        clicksStackView.addArrangedSubviews(clickCards)
    }
}
