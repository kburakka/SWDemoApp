//
//  AlertViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 11.04.2021.
//

import UIKit

final class AlertViewController: BaseViewController<AlertViewModel> {
    
    // MARK: - UI
    private lazy var containerView: UIView = {
        return UIView(backgroundColor: .appWhite,
                      cornerRadius: 11.0)
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.appIcon.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .appShaft
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel.title
        label.font = .font(.omnesSemiBold, size: .xLarge)
        label.textColor = .appShaft
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.cornerRadius = 6
        button.titleLabel?.font = .font(.omnesRegular, size: .large)
        button.backgroundColor = .appShaft
        button.titleLabel?.textColor = .appShaft
        button.setTitle(viewModel.buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        return UIStackView(arrangedSubviews: [titleLabel,
                                              closeButton],
                           axis: .vertical,
                           spacing: 15,
                           alignment: .center,
                           distribution: .fill)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.83)
    }
    
    override func setupViews() {
        super.setupViews()
        containerView.addSubviews([imageView,stackView])
        view.addSubviews([containerView])
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        
        imageView.height(100)
        imageView.width(100)
        imageView.centerX(to: containerView)
        imageView.topToSuperview(offset: 10)
        
        closeButton.height(44.0)
        closeButton.width(155.0)
        
        stackView.topToBottom(of: imageView, offset: 10)
        stackView.edgesToSuperview(excluding: .top, insets: UIEdgeInsets(top: 58.0,
                                                                         left: 20.0,
                                                                         bottom: 20.0,
                                                                         right: 20.0))
        containerView.edgesToSuperview(excluding: [.top, .bottom],
                                       insets: UIEdgeInsets(top: 53.0,
                                                            left: 20.0,
                                                            bottom: 20.0,
                                                            right: 20.0))
        containerView.centerXToSuperview()
        containerView.centerYToSuperview()
        
    }
}

// MARK: - Action
@objc
private extension AlertViewController {
    func closeAction() {
        viewModel.closeCompletion?()
        dismiss(animated: true, completion: nil)
    }
}
