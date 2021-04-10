//
//  CategoriesHelper.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 10.04.2021.
//

import UIKit

class CategoriesHelper {
    static let shared = CategoriesHelper()
    
    func getCategoryIcon(categoryType: CategoryType, isWhite: Bool) -> UIImage {
        switch categoryType {
        case .fashion:
            if isWhite {
                return .imgClothesWhite
            }
            return .imgClothes
        case .homeFurnishing:
            if isWhite {
                return .imgBedroomWhite
            }
            return .imgBedroom
        case .smartHome:
            if isWhite {
                return .imgBedroomWhite
            }
            return .imgXmlid
        case .electricAppliances:
            if isWhite {
                return .imgElectricalWhite
            }
            return .imgElectrical
        case .electronics:
            if isWhite {
                return .imgDevicesWhite
            }
            return .imgDevices
        case .gadgets:
            if isWhite {
                return .imgGadgetWhite
            }
            return .imgGadget
        case .medicalEquipment:
            if isWhite {
                return .imgFirstaidWhite
            }
            return .imgFirstaid
        }
    }
}
