//
//  AccountDetailsCellModel.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import Foundation

protocol AccountDetailsCellDataSource: AnyObject {
    var title: String { get }
}

protocol AccountDetailsCellEventSource: AnyObject { }

protocol AccountDetailsCellProtocol: AccountDetailsCellDataSource, AccountDetailsCellEventSource { }

final class AccountDetailsCellModel: AccountDetailsCellProtocol {
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
