//
//  SignUpViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

final class SignUpViewController: BaseViewController<SignUpViewModel> {
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .xLarge)
        label.textColor = .appShaft
        label.text = "Please complete the fields to sing up"
        label.numberOfLines = 0
        return label
    }()
    
    private let personalDetailTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .large)
        label.textColor = UIColor.appShaft.withAlphaComponent(0.7)
        label.text = "Personal details"
        return label
    }()
    
    private lazy var personalDetailsStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [personalDetailTitleLabel,
                                              nameTextField,
                                              surnameTextField,
                                              ageTextField,
                                              phoneNumberTextField],
                           axis: .vertical,
                           spacing: 15,
                           alignment: .fill,
                           distribution: .equalCentering)
    }()
    
    private lazy var nameTextField: BaseTextField = {
        let textField = AppTextField.passiveTextField(placeholder: "Name*")
        textField.delegate = self
        return textField
    }()
    
    private lazy var surnameTextField: BaseTextField = {
        let textField = AppTextField.passiveTextField(placeholder: "Surname*")
        textField.delegate = self
        return textField
    }()
    
    private lazy var ageTextField: BaseTextField = {
        let textField = AppTextField.passiveTextField(placeholder: "Age*")
        textField.delegate = self
        return textField
    }()
    
    private lazy var phoneNumberTextField: BaseTextField = {
        let textField = AppTextField.passiveTextField(placeholder: "Phone Number*")
        textField.delegate = self
        return textField
    }()
    
    private let loginInfoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesSemiBold, size: .large)
        label.textColor = UIColor.appShaft.withAlphaComponent(0.7)
        label.text = "Log in info"
        return label
    }()
    
    private lazy var loginInfoDetailsStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [loginInfoTitleLabel,
                                              emailTextField,
                                              passwordTextField,
                                              repasswordTextField],
                           axis: .vertical,
                           spacing: 15,
                           alignment: .fill,
                           distribution: .equalCentering)
    }()
    
    private lazy var emailTextField: BaseTextField = {
        let textField = AppTextField.passiveTextField(placeholder: "E-mail*")
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: BaseTextField = {
        let textField = AppTextField.passiveTextField(placeholder: "Password*")
        textField.delegate = self
        return textField
    }()
    
    private lazy var repasswordTextField: BaseTextField = {
        let textField = AppTextField.passiveTextField(placeholder: "Confirm Password*")
        textField.delegate = self
        return textField
    }()
    
    private lazy var agreementsStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [termsStackView,
                                              privacyStackView,
                                              memberStackView],
                           axis: .vertical,
                           spacing: 15,
                           alignment: .fill,
                           distribution: .fill)
    }()
    
    private lazy var termsCheckBox: CheckBox = {
        let checkBox = CheckBox()
        checkBox.addTarget(self, action: #selector(onCheckBoxValueChange(_:)), for: .valueChanged)
        return checkBox
    }()
    
    private let termsLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = .appShaft
        label.text = "I read & agree with Terms of Use."
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var termsStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [termsCheckBox,
                                              termsLabel],
                           axis: .horizontal,
                           spacing: 15,
                           alignment: .center,
                           distribution: .fill)
    }()
    
    private lazy var privacyCheckBox: CheckBox = {
        let checkBox = CheckBox()
        checkBox.addTarget(self, action: #selector(onCheckBoxValueChange(_:)), for: .valueChanged)
        return checkBox
    }()
    
    private let privacyLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = .appShaft
        label.text = "I read & agree with Privacy Policy."
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var privacyStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [privacyCheckBox,
                                              privacyLabel],
                           axis: .horizontal,
                           spacing: 15,
                           alignment: .center,
                           distribution: .fill)
    }()
    
    private lazy var memberCheckBox: CheckBox = {
        let checkBox = CheckBox()
        checkBox.addTarget(self, action: #selector(onCheckBoxValueChange(_:)), for: .valueChanged)
        return checkBox
    }()
    
    private let memberLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.omnesRegular, size: .medium)
        label.textColor = .appShaft
        label.text = "I read & agree with Member Terms and Conditions."
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var memberStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [memberCheckBox,
                                              memberLabel],
                           axis: .horizontal,
                           spacing: 15,
                           alignment: .center,
                           distribution: .fill)
    }()
    
    private let continueButton: BaseButton = {
        let button = BaseButton(title: "Continue",
                                titleFont: .font(.omnesRegular, size: .medium),
                                titleColor: .appWhite)
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        continueButton.layer.insertSublayer(CALayer().appHorizontalGradient(frame: continueButton.bounds), at: 0)
    }

    override func setupViews() {
        view.backgroundColor = .appAlabaster
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubviews([titleLabel, personalDetailsStackView, loginInfoDetailsStackView, agreementsStackView, continueButton])
    }
    
    override func setNeedsFocusUpdate() {
        titleLabel.edgesToSuperview(excluding: .bottom)
        titleLabel.height(70)
        
        scrollView.edgesToSuperview(insets: .init(top: 30, left: 30, bottom: 30, right: 30), usingSafeArea: true)
        containerView.edgesToSuperview()
        containerView.widthToSuperview()
        
        personalDetailsStackView.leadingToSuperview()
        personalDetailsStackView.trailingToSuperview()
        personalDetailsStackView.topToBottom(of: titleLabel, offset: 30)
        
        loginInfoDetailsStackView.leadingToSuperview()
        loginInfoDetailsStackView.trailingToSuperview()
        loginInfoDetailsStackView.topToBottom(of: personalDetailsStackView, offset: 30)
        
        agreementsStackView.leadingToSuperview()
        agreementsStackView.trailingToSuperview()
        agreementsStackView.topToBottom(of: loginInfoDetailsStackView, offset: 30)

        termsCheckBox.height(20)
        termsCheckBox.width(20)
        termsLabel.topToSuperview()
        termsLabel.trailingToSuperview()
        termsLabel.bottomToSuperview()
        
        privacyCheckBox.height(20)
        privacyCheckBox.width(20)
        privacyLabel.topToSuperview()
        privacyLabel.trailingToSuperview()
        privacyLabel.bottomToSuperview()

        memberCheckBox.height(20)
        memberCheckBox.width(20)
        memberLabel.topToSuperview()
        memberLabel.trailingToSuperview()
        memberLabel.bottomToSuperview()

        continueButton.leadingToSuperview()
        continueButton.trailingToSuperview()
        continueButton.topToBottom(of: agreementsStackView, offset: 30)
        continueButton.bottomToSuperview(offset: -30)
        continueButton.height(46)
        
        containerView.layoutIfNeeded()
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField is BaseTextField {
            AppTextField.enableTextField(textField as? BaseTextField)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField is BaseTextField && textField.text?.isEmpty ?? true {
            AppTextField.disableTextField(textField as? BaseTextField)
        }
    }
}

extension SignUpViewController {
    @objc func onCheckBoxValueChange(_ sender: CheckBox) {
        print(sender.isChecked)
    }
}
