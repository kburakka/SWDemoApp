//
//  TestRequest.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 9.04.2021.
//

import Foundation

public struct TestRequest: RequestProtocol {
    
    public typealias ResponseType = Test
    
    public var path: String = ""
    
    public var method: RequestMethod = .get
    
    public var parameters: RequestParameters = [:]
    
    public init() { }

}

// MARK: - Welcome
public struct Test: Decodable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}
