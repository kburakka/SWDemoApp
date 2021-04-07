//
//  LoginViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import UIKit

final class LoginViewController: BaseViewController<LoginViewModel> {
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = .appIcon
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = UIColor.appWhite.withAlphaComponent(0.7)
        label.text = "Demo open your choises"
        label.textAlignment = .center
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .xLarge)
        label.textColor = .appWhite
        label.text = "Welcome!\nYou’ve been missed"
        label.numberOfLines = 2
        return label
    }()
    
    private let emailTextField: BaseTextField = {
        let textField = BaseTextField(placeholderText: "E-mail")
        return textField
    }()
    
    private let passwordTextfield: BaseTextField = {
        let textField = BaseTextField(placeholderText: "Password", isPassword: true)
        return textField
    }()
    
    private let loginButton: BaseButton = {
        let button = BaseButton(title: "Log in",
                                titleFont: .font(.omnesSemiBold, size: .medium),
                                titleColor: .appWhite,
                                backgroundColor: UIColor.appWhite.withAlphaComponent(0.1))
        return button
    }()
    
    private let forgotButton: BaseButton = {
        let button = BaseButton(title: "Forgot Password?",
                                titleFont: .font(.omnesLight, size: .medium),
                                titleColor: UIColor.appWhite.withAlphaComponent(0.6),
                                backgroundColor: .clear)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        return UIStackView(arrangedSubviews: [titleLabel, emailTextField, passwordTextfield, loginButton, forgotButton],
                           axis: .vertical,
                           spacing: 15,
                           alignment: .leading,
                           distribution: .equalCentering)
    }()
    
    private let bodyView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let bottomView: UIView = {
        let view = UIView(backgroundColor: UIColor.appWhite.withAlphaComponent(0.2),
                          cornerRadius: 26)
        return view
    }()
    
    private let registerButton: BaseButton = {
        let button = BaseButton(title: "Register",
                                titleFont: .font(.omnesRegular, size: .medium),
                                titleColor: .appFuchsia,
                                cornerRadius: 20,
                                backgroundColor: .appWhite)
        button.addTarget(self,
                         action: #selector(registerAction),
                         for: .touchUpInside)
        return button
    }()
    
    private let registerLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = .appWhite
        label.text = "Don't have an account?"
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.insertSublayer(CALayer().appVericalGradient(frame: view.bounds), at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func setupViews() {
        bottomView.addSubviews([registerLabel, registerButton])
        bodyView.addSubview(stackView)
        view.addSubviews([appIconImageView, descriptionLabel, bodyView, bottomView])
    }
    
    override func setupLayouts() {
        appIconImageView.centerXToSuperview()
        appIconImageView.height(92)
        appIconImageView.width(92)
        appIconImageView.topToSuperview(offset: 20, usingSafeArea: true)
        
        descriptionLabel.topToBottom(of: appIconImageView, offset: 8)
        descriptionLabel.height(20)
        descriptionLabel.centerXToSuperview()
        
        bodyView.leadingToSuperview()
        bodyView.trailingToSuperview()
        bodyView.topToBottom(of: descriptionLabel)
        bodyView.bottomToTop(of: bottomView)

        stackView.leadingToSuperview(offset: 25)
        stackView.trailingToSuperview(offset: 25)
        stackView.centerYToSuperview()
        
        titleLabel.height(71)
        
        emailTextField.leadingToSuperview()
        emailTextField.trailingToSuperview()
        emailTextField.topToBottom(of: titleLabel, offset: 30)

        passwordTextfield.leadingToSuperview()
        passwordTextfield.trailingToSuperview()
        passwordTextfield.topToBottom(of: emailTextField, offset: 15)
        
        loginButton.leadingToSuperview()
        loginButton.trailingToSuperview()
        loginButton.topToBottom(of: passwordTextfield, offset: 30)
        
        forgotButton.centerXToSuperview()
        forgotButton.height(20)
        forgotButton.topToBottom(of: loginButton, offset: 30)

        bottomView.leadingToSuperview(offset: 25)
        bottomView.trailingToSuperview(offset: 25)
        bottomView.height(52)
        bottomView.bottomToSuperview(offset: -20, usingSafeArea: true)
        
        registerButton.width(113)
        registerButton.edgesToSuperview(excluding: .leading, insets: .init(top: 7, left: 7, bottom: 7, right: 7))
        
        registerLabel.edgesToSuperview(excluding: .trailing, insets: .init(top: 7, left: 20, bottom: 7, right: 7))
        registerLabel.trailingToLeading(of: registerButton, offset: 7)
    }
}

// MARK: - Action
@objc
private extension LoginViewController {
    func registerAction() {
        viewModel.registerButtonAction()
    }
}
