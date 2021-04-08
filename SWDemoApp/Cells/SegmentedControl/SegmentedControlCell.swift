//
//  SegmentedControlCell.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit

class SegmentedControlCell: UITableViewCell, ReusableView {
    
    weak var viewModel: SegmentedControlCellProtocol?
        
    private var topseperetorLine: UIView = {
        let view = UIView(backgroundColor: .appFuchsia)
        return view
    }()
    
    private var bottomseperetorLine: UIView = {
        let view = UIView(backgroundColor: .appFuchsia)
        return view
    }()
    
    let segmentedView: UIView = {
        let view = UIView()
        view.backgroundColor = .appWhite
        return view
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
        contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    private func configureContents() {
        selectionStyle = .none
    }
    
    func set(viewModel: SegmentedControlCellProtocol) {
        self.viewModel = viewModel
        let segmentedControl = BaseSegmentedControl(titles: viewModel.titles)
        
        contentView.addSubviews([topseperetorLine, segmentedControl, bottomseperetorLine])
        bottomseperetorLine.height(1)
        topseperetorLine.height(1)

        topseperetorLine.edgesToSuperview(excluding: .bottom)
        bottomseperetorLine.edgesToSuperview(excluding: .top)

        segmentedControl.leadingToSuperview()
        segmentedControl.trailingToSuperview()
        segmentedControl.topToBottom(of: topseperetorLine)
        segmentedControl.bottomToTop(of: bottomseperetorLine)
        segmentedControl.selectedIndex = viewModel.selectedIndex
        segmentedControl.addTarget(self,
                                   action: #selector(segmentedControlValueChanged(_:)),
                                   for: .valueChanged)
    }
}
// MARK: - Action
@objc
private extension SegmentedControlCell {
    func segmentedControlValueChanged(_ sender: BaseSegmentedControl) {
        viewModel?.segmentedControlClosure?(sender.selectedIndex)
    }
}
