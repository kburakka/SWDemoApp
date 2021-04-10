//
//  CategoryRequest.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 10.04.2021.
//

public struct CategoryRequest: RequestProtocol {
    
    public typealias ResponseType = BaseResponse<[Category]>

    public var path: String = "category"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init() {}
    
}
