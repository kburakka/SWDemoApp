//
//  RegisterRequest.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 10.04.2021.
//

public struct RegisterRequest: RequestProtocol {
    
    public typealias ResponseType = BaseResponse<String>

    public var path: String = "register"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    init(register: Register) {
        parameters["email"] = register.email
        parameters["password"] = register.password
        parameters["name"] = register.name
        parameters["surname"] = register.surname
        parameters["age"] = register.age
        parameters["phone"] = register.phone
        parameters["sex"] = register.sex
    }

}
