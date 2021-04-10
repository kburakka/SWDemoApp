//
//  CategoryVideosRequest.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 11.04.2021.
//

public struct CategoryVideosRequest: RequestProtocol {
    
    public typealias ResponseType = BaseResponse<[Video]>

    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init(id: String) {
        path = "category/\(id)/video"
    }
    
}
