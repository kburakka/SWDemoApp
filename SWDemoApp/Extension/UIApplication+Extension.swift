//
//  UIApplication+Extension.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 9.04.2021.
//

import UIKit

public extension UIApplication {
    class func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        var defaultController = controller
        if defaultController == nil {
            defaultController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController
        }
            
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
