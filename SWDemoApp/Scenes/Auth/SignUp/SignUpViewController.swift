//
//  SignUpViewController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

final class SignUpViewController: BaseViewController<SignUpViewModel> {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let containerView = UIView()
    
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
    
    var selectedGender: Gender = .none
    
    private var genderView: GenderView {
        let genderView = GenderView()
        genderView.genderChange = {
            self.selectedGender = genderView.selectedGender
        }
        return genderView
    }
    
    private lazy var personalDetailsStackView: UIStackView = {
        return UIStackView(arrangedSubviews: [personalDetailTitleLabel,
                                              nameTextField,
                                              surnameTextField,
                                              ageTextField,
                                              phoneNumberTextField,
                                              genderView],
                           axis: .vertical,
                           spacing: 15,
                           alignment: .fill,
                           distribution: .equalCentering)
    }()
    
    private lazy var nameTextField: BaseTextField = {
        let textField = AppTextFieldHelper.passiveTextField(placeholder: "Name*")
        textField.delegate = self
        return textField
    }()
    
    private lazy var surnameTextField: BaseTextField = {
        let textField = AppTextFieldHelper.passiveTextField(placeholder: "Surname*")
        textField.delegate = self
        return textField
    }()
    
    private lazy var ageTextField: BaseTextField = {
        let textField = AppTextFieldHelper.passiveTextField(placeholder: "Age*")
        textField.delegate = self
        return textField
    }()
    
    private lazy var phoneNumberTextField: BaseTextField = {
        let textField = AppTextFieldHelper.passiveTextField(placeholder: "Phone Number*")
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
        let textField = AppTextFieldHelper.passiveTextField(placeholder: "E-mail*")
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: BaseTextField = {
        let textField = AppTextFieldHelper.passiveTextField(placeholder: "Password*")
        textField.delegate = self
        return textField
    }()
    
    private lazy var repasswordTextField: BaseTextField = {
        let textField = AppTextFieldHelper.passiveTextField(placeholder: "Confirm Password*")
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
        button.addTarget(self,
                         action: #selector(continueAction),
                         for: .touchUpInside)
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
        
        scrollView.edgesToSuperview(insets: .init(top: 30, left: 20, bottom: 0, right: 20), usingSafeArea: false)
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
            AppTextFieldHelper.enableTextField(textField as? BaseTextField)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField is BaseTextField && textField.text?.isEmpty ?? true {
            AppTextFieldHelper.disableTextField(textField as? BaseTextField)
        }
    }
}

// MARK: - Action
@objc
extension SignUpViewController {
    func onCheckBoxValueChange(_ sender: CheckBox) {
        switch sender {
        case termsCheckBox:
            print("terms \(sender.isChecked)")
        case privacyCheckBox:
            print("privacy \(sender.isChecked)")
        case memberCheckBox:
            print("member \(sender.isChecked)")
        default:
            print("none")
        }
    }
    
    func continueAction() {
        if let email = emailTextField.text, !email.isEmpty,
           let password = passwordTextField.text, !password.isEmpty,
           let repassword = repasswordTextField.text, !password.isEmpty,
           let name = nameTextField.text, !name.isEmpty,
           let surname = surnameTextField.text, !surname.isEmpty,
           let age = ageTextField.text, !age.isEmpty,
           let phone = phoneNumberTextField.text, !phone.isEmpty {
            let ageInt = Int(age) ?? 0
            if password == repassword {
                if selectedGender != .none {
                    let register = Register(email: email,
                                            password: password,
                                            name: name,
                                            surname: surname,
                                            age: ageInt,
                                            phone: phone,
                                            sex: selectedGender.rawValue)
                    viewModel.continueButtonAction(register: register)
                } else {
                    showAlert(title: "Warning", message: "Please select gender.")
                }
            } else {
                showAlert(title: "Warning", message: "Your passwords does not match!")
            }
        } else {
            showAlert(title: "Warning", message: "Please fill all fields.")
        }

    }
}
