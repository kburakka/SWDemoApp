//
//  AppRouter.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

import Foundation
import UIKit

final class AppRouter: Router, AppRouter.Routes {
    // This typealias includes the routes which AppRouter can open
    typealias Routes = LoginRoute
    
    static let shared = AppRouter()
    
    func startApp() {
        pushLogin()
    }
}
