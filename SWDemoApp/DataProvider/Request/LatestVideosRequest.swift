//
//  LatestVideosRequest.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 10.04.2021.
//

public struct LatestVideosRequest: RequestProtocol {
    
    public typealias ResponseType = BaseResponse<[Video]>

    public var path: String = "video/latest/video"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    
    public init() {}
    
}
