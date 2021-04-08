//
//  AccountDetailsCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit

class AccountDetailsCell: UITableViewCell, ReusableView {
    
    weak var viewModel: AccountDetailsCellProtocol?
    
    let detailButton: BaseButton = {
        let button = BaseButton(titleFont: .font(.omnesRegular, size: .medium),
                                titleColor: .appWhite)
        button.clipsToBounds = true
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
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30))
        detailButton.layer.insertSublayer(CALayer().appHorizontalGradient(frame: detailButton.bounds), at: 0)
    }

    private func configureContents() {
        selectionStyle = .none
        contentView.addSubview(detailButton)
        detailButton.edgesToSuperview()
    }
    
    func set(viewModel: AccountDetailsCellProtocol) {
        self.viewModel = viewModel
        detailButton.setTitle(viewModel.title, for: .normal)
    }
    
}
