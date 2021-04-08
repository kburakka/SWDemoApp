//
//  ClickToCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import Foundation

protocol ClickToCellDataSource: AnyObject {
    var clicks: [Click] { get }
    var title: String { get }
}

protocol ClickToCellEventSource: AnyObject { }

protocol ClickToCellProtocol: ClickToCellDataSource, ClickToCellEventSource { }

final class ClickToCellModel: ClickToCellProtocol {
    var title: String
    
    var clicks: [Click]
    
    init(clicks: [Click], title: String) {
        self.clicks = clicks
        self.title = title
    }
}
