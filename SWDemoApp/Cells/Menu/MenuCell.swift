//
//  MenuCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import UIKit

class MenuCell: UITableViewCell, ReusableView {
    
    weak var viewModel: MenuCellProtocol?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .large)
        label.textColor = .appShaft
        return label
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
        contentView.backgroundColor = .clear
        contentView.addSubview(titleLabel)
        titleLabel.edgesToSuperview()
    }
    
    func set(viewModel: MenuCellProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        if viewModel.isSelected {
            titleLabel.font = .font(.omnesSemiBold, size: .large)
        } else {
            titleLabel.font = .font(.omnesRegular, size: .large)
        }
    }
    
}
