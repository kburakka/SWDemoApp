//
//  ChatCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit

class ChatCell: UITableViewCell, ReusableView {
    
    weak var viewModel: ChatCellProtocol?
    
    private let needHelpLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = UIColor.appShaft.withAlphaComponent(0.5)
        label.textAlignment = .right
        label.text = "Need help?"
        return label
    }()
    
    let chatButton: BaseButton = {
        let button = BaseButton(titleFont: .font(.omnesRegular, size: .medium),
                                titleColor: .appWhite)
        button.clipsToBounds = true
        button.setTitle("Chat", for: .normal)
        return button
    }()
    
    private lazy var chatStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [needHelpLabel, chatButton],
                           axis: .horizontal,
                           spacing: 20,
                           alignment: .trailing,
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30))
        chatButton.layer.insertSublayer(CALayer().appHorizontalGradient(frame: chatButton.bounds), at: 0)
    }
    
    private func configureContents() {
        selectionStyle = .none
        contentView.addSubview(chatStackView)
        chatStackView.trailingToSuperview()
        chatStackView.topToSuperview()
        chatStackView.bottomToSuperview()
        chatButton.height(46)
        chatButton.width(98)
        
        needHelpLabel.height(46)
    }
    
    func set(viewModel: ChatCellProtocol) {
        self.viewModel = viewModel
    }
}
