//
//  AppTextField.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

class AppTextFieldHelper {
    static func passiveTextField(placeholder: String? = nil) -> BaseTextField {
        let textField = BaseTextField(placeholderText: placeholder,
                                      placeholderColor: UIColor.appShaft.withAlphaComponent(0.5),
                                      textColor: .appShaft,
                                      tintColor: UIColor.appShaft.withAlphaComponent(0.5),
                                      backgroundColor: .appAlabaster, borderWidth: 1,
                                      borderColor: UIColor.appShaft.withAlphaComponent(0.5).cgColor)
        return textField
    }
    
    static func enableTextField(_ textField: BaseTextField?) {
        textField?.placeholderColor = .appShaft
        textField?.tintColor = .appShaft
        textField?.layer.borderColor = UIColor.appShaft.cgColor
        textField?.layer.backgroundColor = UIColor.appWhite.cgColor
    }
    
    static func disableTextField(_ textField: BaseTextField?) {
        textField?.placeholderColor = UIColor.appShaft.withAlphaComponent(0.5)
        textField?.tintColor = UIColor.appShaft.withAlphaComponent(0.5)
        textField?.layer.borderColor = UIColor.appShaft.withAlphaComponent(0.5).cgColor
        textField?.layer.backgroundColor = UIColor.appAlabaster.cgColor
    }
}
