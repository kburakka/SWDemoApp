//
//  MenuViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 7.04.2021.
//

import Foundation

protocol MenuViewDataSource {
    var menuItemModels: [MenuCellModel] { get }
}

protocol MenuViewEventSource {}

protocol MenuViewProtocol: MenuViewDataSource, MenuViewEventSource {}

final class MenuViewModel: BaseViewModel<MenuRouter>, MenuViewProtocol {
    var menuItemModels: [MenuCellModel] = [MenuCellModel(title: "Home", isSelected: true),
                                           MenuCellModel(title: "My Categories", isSelected: false),
                                           MenuCellModel(title: "My Videos", isSelected: false),
                                           MenuCellModel(title: "Settings", isSelected: false),
                                           MenuCellModel(title: "My Account", isSelected: false),
                                           MenuCellModel(title: "Chat", isSelected: false),
                                           MenuCellModel(title: "Contact us", isSelected: false),
                                           MenuCellModel(title: "About us", isSelected: false)]
}
