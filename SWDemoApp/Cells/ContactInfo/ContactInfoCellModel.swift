//
//  ContactInfoCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import Foundation

protocol ContactInfoCellDataSource: AnyObject {
    var title: String { get }
}

protocol ContactInfoCellEventSource: AnyObject { }

protocol ContactInfoCellProtocol: ContactInfoCellDataSource, ContactInfoCellEventSource { }

final class ContactInfoCellModel: ContactInfoCellProtocol {
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
