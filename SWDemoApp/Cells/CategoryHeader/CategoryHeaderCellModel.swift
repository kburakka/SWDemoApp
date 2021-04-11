//
//  CategoryHeaderCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 6.04.2021.
//

import UIKit

protocol CategoryHeaderCellDataSource: AnyObject {
    var name: String { get }
    var title: NSAttributedString { get }

}

protocol CategoryHeaderCellEventSource: AnyObject { }

protocol CategoryHeaderCellProtocol: CategoryHeaderCellDataSource, CategoryHeaderCellEventSource { }

final class CategoryHeaderCellModel: CategoryHeaderCellProtocol {
    var name: String
    
    lazy var title: NSAttributedString = {
        var multipleAttributes = [NSAttributedString.Key: Any]()
        multipleAttributes[NSAttributedString.Key.font] = UIFont.font(.omnesSemiBold, size: .xLarge)
        multipleAttributes[NSAttributedString.Key.foregroundColor] = UIColor.cyan
        
        var mainAttributes = [NSAttributedString.Key: Any]()
        mainAttributes[NSAttributedString.Key.font] = UIFont.font(.omnesSemiBold, size: .xLarge)
        mainAttributes[NSAttributedString.Key.foregroundColor] = UIColor.appShaft
        
        let myString = "Hello, \(name)!\nWhich are your favorite categories?"
        let myAttrString = NSMutableAttributedString(string: myString)

        let nsRange = NSString(string: myString).range(of: "\(name)!", options: String.CompareOptions.caseInsensitive)
        let nsRangeFirst = NSString(string: myString).range(of: "Hello, ", options: String.CompareOptions.caseInsensitive)
        let nsRangeLast = NSString(string: myString).range(of: "Which are your favorite categories?", options: String.CompareOptions.caseInsensitive)
        myAttrString.addAttributes(multipleAttributes, range: nsRange)
        myAttrString.addAttributes(mainAttributes, range: nsRangeFirst)
        myAttrString.addAttributes(mainAttributes, range: nsRangeLast)

        return myAttrString
    }()
    
    init(name: String) {
        self.name = name
    }
}
