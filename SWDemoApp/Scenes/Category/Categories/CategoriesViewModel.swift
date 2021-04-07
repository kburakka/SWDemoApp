//
//  CategoriesViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import Foundation

protocol CategoriesViewDataSource {
    var categories: [Category] { get }
    var categoryHeaderModel: CategoryHeaderCellModel { get }
    var categoryCellModels: [CategoryCellModel] { get }
}

protocol CategoriesViewEventSource {
    func comfirmButtonAction()
    func didSelectItemAt(index: Int)
}

protocol CategoriesViewProtocol: CategoriesViewDataSource, CategoriesViewEventSource {}

final class CategoriesViewModel: BaseViewModel<CategoriesRouter>, CategoriesViewProtocol {
    
    lazy var categoryCellModels: [CategoryCellModel] = {
        var categoryCellModels: [CategoryCellModel] = []
        for category in categories {
            categoryCellModels.append(CategoryCellModel(category: category))
        }
        return categoryCellModels
    }()

    var categories: [Category] = [Category(id: 1,
                                           title: "Home furnishing",
                                           icon: .imgBedroom,
                                           iconWhite: .imgBedroomWhite,
                                           isSelected: false,
                                           videoCount: 7),
                                  Category(id: 2,
                                           title: "Smart home",
                                           icon: .imgXmlid,
                                           iconWhite: .imgBedroomWhite,
                                           isSelected: false,
                                           videoCount: 7),
                                  Category(id: 3,
                                           title: "Fashion",
                                           icon: .imgClothes,
                                           iconWhite: .imgClothesWhite,
                                           isSelected: false,
                                           videoCount: 7),
                                  Category(id: 4,
                                           title: "Electric appliances",
                                           icon: .imgElectrical,
                                           iconWhite: .imgElectricalWhite,
                                           isSelected: false,
                                           videoCount: 7),
                                  Category(id: 5,
                                           title: "Electronics",
                                           icon: .imgDevices,
                                           iconWhite: .imgDevicesWhite,
                                           isSelected: false,
                                           videoCount: 7),
                                  Category(id: 6,
                                           title: "Gadgets",
                                           icon: .imgGadget,
                                           iconWhite: .imgGadgetWhite,
                                           isSelected: false,
                                           videoCount: 7),
                                  Category(id: 7,
                                           title: "Medical equipment",
                                           icon: .imgFirstaid,
                                           iconWhite: .imgFirstaidWhite,
                                           isSelected: false,
                                           videoCount: 7)]
    
    var categoryHeaderModel = CategoryHeaderCellModel(title: "Hello, Alex!\nWhich are your favorite categories?")
    
    func didSelectItemAt(index: Int) {
        categoryCellModels[index].category.isSelected.toggle()
        categories.first(where: { $0.id == categoryCellModels[index].category.id })?.isSelected.toggle()
        categoryCellModels[index].tapButtonAction()
    }
    
    func comfirmButtonAction() {
        router.pushHome(categories: categories)
    }
}
