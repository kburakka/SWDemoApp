//
//  UIView+Extension.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import UIKit
 
extension UIView {
    convenience init(backgroundColor: UIColor?,
                     cornerRadius: CGFloat = 0.0) {
        self.init()
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
    
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.clipsToBounds = true
        }
    }
    
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
    
    func addShadow(ofColor color: UIColor = UIColor.appBlack.withAlphaComponent(16),
                   radius: CGFloat = 3,
                   offset: CGSize = .zero,
                   opacity: Float = 0.6) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}
