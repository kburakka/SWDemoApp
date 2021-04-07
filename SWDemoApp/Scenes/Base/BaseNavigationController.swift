//
//  BaseNavigationController.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    deinit {
        debugPrint("deinit \(self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
    }
    
    private func setNavBar() {
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.font(.omnesSemiBold, size: .large)]
        navigationBar.shadowImage = UIImage()
        navigationBar.backgroundColor = .appWhite
        navigationBar.tintColor = .appShaft
        navigationBar.titleTextAttributes = attributes

        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor = .appAlabaster
            appearance.backgroundColor = .appAlabaster
            appearance.titleTextAttributes = attributes
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
        }
    }
}
