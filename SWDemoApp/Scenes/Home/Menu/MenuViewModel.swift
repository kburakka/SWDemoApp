//
//  MenuViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation

protocol MenuViewDataSource {
    var menuItems: [String] { get }
}

protocol MenuViewEventSource {}

protocol MenuViewProtocol: MenuViewDataSource, MenuViewEventSource {}

final class MenuViewModel: BaseViewModel<MenuRouter>, MenuViewProtocol {
    var menuItems: [String] = ["Home",
                               "My Categories",
                               "My Videos",
                               "Settings",
                               "My Account",
                               "Chat",
                               "Contact us",
                               "About us"]
}
