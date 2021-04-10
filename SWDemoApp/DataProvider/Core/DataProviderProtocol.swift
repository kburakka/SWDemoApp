//
//  DataProviderProtocol.swift
//  HowClose
//
//  Created by Burak Kaya on 13.03.2021.
//

import Alamofire

public typealias DataProviderResult<T: Decodable> = ((Result<T, ApiError>) -> Void)

public protocol DataProviderProtocol {
    func fetchData<T: RequestProtocol>(for request: T,
                                     result: DataProviderResult<T.ResponseType>?)
    
}
