//
//  Interceptor.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 9.04.2021.
//

import Foundation
import Alamofire

protocol RequestHeaderStorage: AnyObject {
    var accessToken: String? { get }
    var languageCode: String { get }
    
    func didGetUnauthorizedError()
}

final class APIInterceptor: Alamofire.RequestInterceptor {
    private let storage: RequestHeaderStorage

    // MARK: - Initilize
    internal init(storage: RequestHeaderStorage) {
        self.storage = storage
    }

    // MARK: - Request Interceptor Method
    internal func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        if let token = self.storage.accessToken {
            urlRequest.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        }
        // Set Accept-Language header value using language code
        urlRequest.setValue(storage.languageCode, forHTTPHeaderField: "Accept-Language")
        
        // Arrange Request logs for develope and staging environment
        #if !RELEASE
        print("-------------------Request-------------------------")
        if let requestUrl = urlRequest.url?.absoluteString {
            print("Request Url: \(requestUrl)")
        }
        if let requestMethod = urlRequest.httpMethod {
            print("Request Method: \(requestMethod)")
        }
        if let httpBody = urlRequest.httpBody, let parameters = String(data: httpBody, encoding: .utf8) {
            print("Request Parameters: \(parameters)")
        }
        if let requestHeader = urlRequest.allHTTPHeaderFields {
            print("Request Headers: \(requestHeader)")
        }
        print("-------------------End Of Request-------------------")
        #endif
        completion(.success(urlRequest))
    }
    
    // MARK: - Error Retry Method
    internal func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        // Arrange Error logs for develope and staging environment
        #if !RELEASE
        print("-------------------Error--------------------------")
        if let requestUrl = request.request?.url?.absoluteString {
            print("Request Url: \(requestUrl)")
        }
        if let errorCode = request.response?.statusCode {
            print("Error Code: \(errorCode)")
        }
        if let errorDescription = error.asAFError?.errorDescription {
            print("Error Description: \(errorDescription)")
        }
        print("-------------------End Of Error-------------------")
        #endif
        completion(.doNotRetryWithError(error))
    }

}
