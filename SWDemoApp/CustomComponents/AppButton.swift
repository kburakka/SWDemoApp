//
//  AppButton.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import UIKit

class AppButton: UIButton {
    
    convenience init(type: ButtonType = .custom,
                     title: String? = nil,
                     image: UIImage? = nil,
                     titleFont: UIFont? = nil,
                     titleColor: UIColor? = .black,
                     alignment: ContentHorizontalAlignment = .center,
                     contentEdgeInsets: UIEdgeInsets = .init(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0),
                     cornerRadius: CGFloat? = 23,
                     preferredHeight: CGFloat = 46,
                     isEnabled: Bool = true,
                     backgroundColor: UIColor? = .white) {
        
        self.init(type: type)
        
        setTitle(title, for: .normal)

        setImage(image, for: .normal)
        
        if let font = titleFont {
            titleLabel?.font = font
        }
        
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
        
        self.contentHorizontalAlignment = alignment
        self.contentEdgeInsets = contentEdgeInsets
        self.isEnabled = isEnabled
        
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.preferredHeight = preferredHeight
    }
    
    var preferredHeight: CGFloat {
        get {
            return frame.size.height
        }
        set {
            self.height(newValue)
        }
    }
}
