//
//  BrandDetailViewModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import Foundation

protocol BrandDetailViewDataSource {
    var video: Video? { get }
    var categories: [Category] { get }
    var aboutUsCellModel: BrandDescriptionCellModel { get }
    var segmentCellModel: SegmentedControlCellModel { get }
    var categoriesCellModel: BrandCategoryCellModel { get }
    var segmentedControlClosure: IntClosure? { get set }
    var segmentSelectedIndex: Int { get }
}

protocol BrandDetailViewEventSource {}

protocol BrandDetailViewProtocol: BrandDetailViewDataSource, BrandDetailViewEventSource {}

final class BrandDetailViewModel: BaseViewModel<BrandDetailRouter>, BrandDetailViewProtocol {
    var categories: [Category] = []
//        Category(id: 1,
//                                           title: "Home furnishing",
//                                           icon: .imgBedroom,
//                                           iconWhite: .imgBedroomWhite,
//                                           isSelected: false,
//                                           videoCount: 7),
//                                  Category(id: 2,
//                                           title: "Smart home",
//                                           icon: .imgXmlid,
//                                           iconWhite: .imgBedroomWhite,
//                                           isSelected: false,
//                                           videoCount: 7),
//                                  Category(id: 3,
//                                           title: "Fashion",
//                                           icon: .imgClothes,
//                                           iconWhite: .imgClothesWhite,
//                                           isSelected: false,
//                                           videoCount: 7)]
    // YOOOO

    
    var segmentSelectedIndex: Int = 0
    
    var video: Video?
    
    let sampleDesc = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
    veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip
    ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
    dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    """
    var segmentedControlClosure: IntClosure?
    
    lazy var aboutUsCellModel = BrandDescriptionCellModel(title: "About us",
                                                          description: sampleDesc,
                                                          numberOfDescLines: 5,
                                                          isShowSeperatorLine: false)
    
    lazy var segmentCellModel = SegmentedControlCellModel(titles: ["Info", "Categories"], selectedIndex: segmentSelectedIndex)
    
    lazy var categoriesCellModel = BrandCategoryCellModel(categories: categories, title: "Our Categories")
    
}
