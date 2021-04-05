//
//  UIFont+Extensions.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import UIKit

public extension UIFont {
    
    enum FontWeight {
        case omnesLight
        case omnesRegular
        case omnesSemiBold
    }
    
    enum FontSize {
        /// 6
        case xSmall
        
        /// 10
        case small
        
        /// 16
        case medium
        
        /// 30
        case large
        
        /// 45
        case xLarge
        
        /// 60
        case xxLarge
        
        /// custom
        case custom(size: CGFloat)
        
        public var rawValue: CGFloat {
            switch self {
            case .xSmall:           return 6
            case .small:            return 10
            case .medium:           return 16
            case .large:            return 30
            case .xLarge:           return 45
            case .xxLarge:          return 60
            case .custom(let size): return size
            }
        }
    }
    
    static func font(_ weight: UIFont.FontWeight, size: FontSize) -> UIFont {
        let font: UIFont
        switch weight {
        case .omnesLight:
            font = FontFamily.Omnes.light.font(size: size.rawValue)
        case .omnesRegular:
            font = FontFamily.Omnes.regular.font(size: size.rawValue)
        case .omnesSemiBold:
            font = FontFamily.Omnes.semibold.font(size: size.rawValue)
        }
        return font
    }
    
}
