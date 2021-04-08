//
//  SegmentedControlCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import Foundation

protocol SegmentedControlCellDataSource: AnyObject {
    var titles: [String] { get }
    var segmentedControlClosure: IntClosure? { get set }
    var selectedIndex: Int { get }
}

protocol SegmentedControlCellEventSource: AnyObject { }

protocol SegmentedControlCellProtocol: SegmentedControlCellDataSource, SegmentedControlCellEventSource { }

final class SegmentedControlCellModel: SegmentedControlCellProtocol {
    var selectedIndex: Int
    
    var segmentedControlClosure: IntClosure? = nil
    
    var titles: [String]

    init(titles: [String], selectedIndex: Int) {
        self.titles = titles
        self.selectedIndex = selectedIndex
    }
}
