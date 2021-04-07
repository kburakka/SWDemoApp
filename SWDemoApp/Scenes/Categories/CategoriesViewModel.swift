//
//  CategoriesViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import Foundation

protocol CategoriesViewDataSource {
    var categoryModels: [CategoryCellModel] { get }
    var categoryHeaderModel: CategoryHeaderCellModel { get }
}

protocol CategoriesViewEventSource {
    func comfirmButtonAction()
    func didSelectItemAt(index: Int)
}

protocol CategoriesViewProtocol: CategoriesViewDataSource, CategoriesViewEventSource {}

final class CategoriesViewModel: BaseViewModel<CategoriesRouter>, CategoriesViewProtocol {
    var categoryModels: [CategoryCellModel] = [CategoryCellModel(title: "Home furnishing",
                                                                 icon: .imgBedroom,
                                                                 isSelected: false),
                                               CategoryCellModel(title: "Smart home",
                                                                 icon: .imgXmlid,
                                                                 isSelected: false),
                                               CategoryCellModel(title: "Fashion",
                                                                 icon: .imgClothes,
                                                                 isSelected: false),
                                               CategoryCellModel(title: "Electric appliances",
                                                                 icon: .imgElectrical,
                                                                 isSelected: false),
                                               CategoryCellModel(title: "Electronics",
                                                                 icon: .imgDevices,
                                                                 isSelected: false),
                                               CategoryCellModel(title: "Gadgets",
                                                                 icon: .imgGadget,
                                                                 isSelected: false),
                                               CategoryCellModel(title: "Medical equipment",
                                                                 icon: .imgFirstaid,
                                                                 isSelected: false)]
    var categoryHeaderModel = CategoryHeaderCellModel(title: "Hello, Alex!\nWhich are your favorite categories?")
    
    func didSelectItemAt(index: Int) {
        categoryModels[index].tapButtonAction()
    }
    
    func comfirmButtonAction() {
        router.pushHome()
    }
}
