//
//  LoginRequest.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 10.04.2021.
//

public struct LoginRequest: RequestProtocol {
    
    public typealias ResponseType = BaseResponse<String>

    public var path: String = "login"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(email: String, password: String) {
        parameters["email"] = email
        parameters["password"] = password
    }
}
