//
//  RegisterViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import UIKit

final class RegisterViewController: BaseViewController<RegisterViewModel> {
    
    private let topView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    private let registerTopCardView: RegisterTopCard = {
        let view = RegisterTopCard()
        return view
    }()
    
    private let bodyView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .xLarge)
        label.textColor = .appShaft
        label.text = "Select sing up option"
        return label
    }()
    
    private let ownButton: BaseButton = {
        let button = BaseButton(title: "I own a business",
                                image: .imgBuilding,
                                titleFont: .font(.omnesRegular, size: .medium),
                                titleColor: .appWhite,
                                backgroundColor: .blue)
        button.clipsToBounds = true
        return button
    }()
    
    private let viewButton: BaseButton = {
        let button = BaseButton(title: "I want to view videos",
                                image: UIImage.imgUser.resize(targetSize: CGSize(width: 18, height: 23)),
                                titleFont: .font(.omnesRegular, size: .medium),
                                titleColor: .appShaft,
                                backgroundColor: .clear,
                                borderWidth: 1,
                                borderColor: .appShaft)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        return UIStackView(arrangedSubviews: [titleLabel, ownButton, viewButton],
                           axis: .vertical,
                           spacing: 20,
                           alignment: .leading,
                           distribution: .equalCentering)
    }()
    
    private let bottomView: UIView = {
        let view = UIView(backgroundColor: .appWhite,
                          cornerRadius: 26)
        view.addShadow()
        return view
    }()
    
    private let loginButton: BaseButton = {
        let button = BaseButton(title: "Login",
                                titleFont: .font(.omnesRegular, size: .medium),
                                titleColor: .appWhite,
                                cornerRadius: 20,
                                backgroundColor: .appFuchsia)
        button.addTarget(self,
                         action: #selector(loginAction),
                         for: .touchUpInside)
        return button
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = .appShaft
        label.text = "Already a member?"
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appWhite
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ownButton.layer.insertSublayer(CALayer().appHorizontalGradient(frame: ownButton.bounds), at: 0)
        topView.layer.insertSublayer(CALayer().appVericalGradient(frame: topView.bounds), at: 0)
    }
    
    override func setupViews() {
        topView.addSubview(registerTopCardView)
        bodyView.addSubview(stackView)
        bottomView.addSubviews([loginLabel, loginButton])
        view.addSubviews([topView, bodyView, bottomView])
    }
    
    override func setupLayouts() {
        topView.leadingToSuperview()
        topView.trailingToSuperview()
        topView.topToSuperview()
        topView.height(view.frame.height / 2)
        
        registerTopCardView.aspectRatio(278 / 249)
        registerTopCardView.leadingToSuperview(offset: 45)
        registerTopCardView.trailingToSuperview(offset: 45)
        registerTopCardView.centerYToSuperview()
        
        bodyView.topToBottom(of: topView)
        bodyView.bottomToTop(of: bottomView)
        bodyView.leadingToSuperview()
        bodyView.trailingToSuperview()
        
        ownButton.topToBottom(of: titleLabel, offset: 30)
        ownButton.leadingToSuperview()
        ownButton.trailingToSuperview()
        
        viewButton.leadingToSuperview()
        viewButton.trailingToSuperview()
        
        stackView.centerYToSuperview()
        stackView.leadingToSuperview(offset: 25)
        stackView.trailingToSuperview(offset: 25)
        
        bottomView.leadingToSuperview(offset: 25)
        bottomView.trailingToSuperview(offset: 25)
        bottomView.height(52)
        bottomView.bottomToSuperview(offset: -20, usingSafeArea: true)
        
        loginButton.width(113)
        loginButton.edgesToSuperview(excluding: .leading, insets: .init(top: 7, left: 7, bottom: 7, right: 7))
        
        loginLabel.edgesToSuperview(excluding: .trailing, insets: .init(top: 7, left: 20, bottom: 7, right: 7))
        loginLabel.trailingToLeading(of: loginButton, offset: 7)
        view.layoutIfNeeded()
    }
}

// MARK: - Action
@objc
private extension RegisterViewController {
    func loginAction() {
        viewModel.loginButtonAction()
    }
}
