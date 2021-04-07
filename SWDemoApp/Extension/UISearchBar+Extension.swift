//
//  UISearchBar+Extension.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import UIKit

extension UISearchBar {
    public var textField: UITextField? {
        return searchTextField
    }
    
    func setRightImage(image: UIImage) {
        showsBookmarkButton = true
        if let btn = textField?.rightView as? UIButton {
            btn.setImage(image,
                         for: .normal)
        }
    }
}
