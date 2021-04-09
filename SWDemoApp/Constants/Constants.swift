//
//  Constants.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 9.04.2021.
//

import Foundation

class Constants {
    static let baseUrl = "https://jsonplaceholder.typicode.com/todos/1"
}


class InterceptorInterface: RequestHeaderStorage {
        
    // You need to set token here we should save token to the keychain not to Userdefaults
    var accessToken: String? {
        return "DefaultsKey.token.value"
    }
    
    var languageCode: String {
        return "en"
    }
    
    // Handle 401 error in here
    func didGetUnauthorizedError() {
        print("you are unauthorized")
    }
    
    init() {}
}

class ApiProvider {
    static let shared = APIDataProvider(storage: InterceptorInterface())
}
