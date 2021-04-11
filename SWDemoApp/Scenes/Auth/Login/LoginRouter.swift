//
//  LoginRouter.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 5.04.2021.
//

final class LoginRouter: Router, LoginRouter.Routes {
    typealias Routes = RegisterRoute & HomeRoute & AlertRoute
}
