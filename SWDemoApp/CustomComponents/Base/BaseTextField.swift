//
//  BaseTextField.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import UIKit
import TinyConstraints

class BaseTextField: UITextField {
    private var multiplePlaceholderAttributes: [NSAttributedString.Key: Any] = [:]
    var isShowPassword = false
    let passwordButton = UIButton(type: .custom)
    let showPasswordImage = UIImage.imgShowPassword.resize(targetSize: CGSize(width: 40, height: 30)).withRenderingMode(.alwaysTemplate)
    let hidePasswordImage = UIImage.imgHidePassword.resize(targetSize: CGSize(width: 40, height: 30)).withRenderingMode(.alwaysTemplate)
    
    // MARK: - Convenience Init
    convenience init(placeholderText: String? = nil,
                     placeholderColor: UIColor? = UIColor.appWhite.withAlphaComponent(0.5),
                     placeholderFont: UIFont? = .font(.omnesRegular, size: .medium),
                     isPassword: Bool = false,
                     leftPadding: CGFloat? = 16.0,
                     textFont: UIFont? = .font(.omnesRegular, size: .medium),
                     textColor: UIColor? = .appWhite,
                     textAlignment: NSTextAlignment = .natural,
                     cornerRadius: CGFloat? = 23,
                     preferredHeight: CGFloat = 46,
                     tintColor: UIColor? = UIColor.appWhite.withAlphaComponent(0.5),
                     backgroundColor: UIColor = .clear,
                     borderWidth: CGFloat = 1,
                     borderColor: CGColor? = UIColor.appWhite.cgColor) {
        self.init()
        self.autocapitalizationType = autocapitalizationType
        self.placeholderFont = placeholderFont
        self.placeholderColor = placeholderColor
        self.leftPadding = leftPadding
        self.font = textFont
        self.textColor = textColor
        self.textAlignment = textAlignment
        if let aCornerRadius = cornerRadius {
            self.cornerRadius = aCornerRadius
        }
        self.preferredHeight = preferredHeight
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        if placeholderFont != nil || placeholderColor != nil {
            self.attributedPlaceholder = NSAttributedString(string: placeholderText ?? "",
                                                            attributes: multiplePlaceholderAttributes)
        } else {
            self.attributedPlaceholder = nil
            self.placeholder = placeholderText
        }
        
        if isPassword {
            isSecureTextEntry = true
            setImage()
        } else {
            rightViewMode = .never
            rightView = nil
        }
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding ?? 0.0
        return textRect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.textRect(forBounds: bounds)
        textRect.origin.x += leftPadding ?? 0.0
        return textRect
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.editingRect(forBounds: bounds)
        textRect.origin.x += leftPadding ?? 0.0
        return textRect
    }
        
    var preferredHeight: CGFloat {
        get {
            return frame.size.height
        }
        set {
            self.height(newValue)
        }
    }
    
    var leftPadding: CGFloat?
    
    var placeholderFont: UIFont? {
        get {
            return multiplePlaceholderAttributes[.font] as? UIFont
        }
        set {
            if let newValue = newValue {
                multiplePlaceholderAttributes[.font] = newValue
            }
        }
    }
    
    var placeholderColor: UIColor? {
        get {
            return multiplePlaceholderAttributes[.foregroundColor] as? UIColor
        }
        set {
            if let newValue = newValue {
                multiplePlaceholderAttributes[.foregroundColor] = newValue
            }
        }
    }
      
    // MARK: - Private Function
    private func setImage() {
        passwordButton.tintColor = tintColor
        passwordButton.setImage(showPasswordImage, for: .normal)
        passwordButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 0)
        passwordButton.frame = CGRect(x: CGFloat(frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        passwordButton.addTarget(self, action: #selector(passwordAction), for: .touchUpInside)
        
        rightView = passwordButton
        rightViewMode = .always
    }
}

// MARK: - Action
@objc
private extension BaseTextField {
    func passwordAction() {
        isShowPassword.toggle()
        if isShowPassword {
            isSecureTextEntry = false
            passwordButton.setImage(showPasswordImage, for: .normal)
        } else {
            isSecureTextEntry = true
            passwordButton.setImage(hidePasswordImage, for: .normal)
        }
    }
}
