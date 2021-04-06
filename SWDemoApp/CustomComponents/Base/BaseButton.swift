//
//  BaseButton.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import UIKit

class BaseButton: UIButton {
    
    convenience init(type: ButtonType = .custom,
                     title: String? = nil,
                     image: UIImage? = nil,
                     titleFont: UIFont? = nil,
                     titleColor: UIColor = .black,
                     alignment: ContentHorizontalAlignment = .center,
                     contentEdgeInsets: UIEdgeInsets = .init(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0),
                     cornerRadius: CGFloat? = 23,
                     preferredHeight: CGFloat = 46,
                     isEnabled: Bool = true,
                     backgroundColor: UIColor? = .white,
                     borderWidth: CGFloat = 0,
                     borderColor: UIColor? = nil) {
        
        self.init(type: type)
        
        setTitle(title, for: .normal)
        
        setImage(image, for: .normal)
        
        tintColor = titleColor
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
        self.layer.borderWidth = borderWidth
        if let borderColor = borderColor?.cgColor {
            self.layer.borderColor = borderColor
        }
        
        if image != nil {
            titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 0.0)
        }
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
