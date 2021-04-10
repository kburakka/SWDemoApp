//
//  RequestProtocol.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 9.04.2021.
//

public typealias RequestParameters = [String: Any]

public protocol RequestProtocol {
    
    associatedtype ResponseType: Decodable
            
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var encoding: RequestEncoding { get }
    var url: String { get }
}

public extension RequestProtocol {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

public extension RequestProtocol {
    var url: String {
        return Constants.baseUrl + path
    }
}

public enum RequestEncoding {
    case url
    case json
}
