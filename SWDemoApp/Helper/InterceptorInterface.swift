//
//  InterceptorInterface.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 10.04.2021.
//

class InterceptorInterface: RequestHeaderStorage {
        
    // You need to set token here we should save token to the keychain not to Userdefaults
    var accessToken: String? {
        return UserDefaultsHelper.getData(type: String.self, forKey: .token)
    }

    // Handle 401 error in here
    func didGetUnauthorizedError() {
        print("you are unauthorized")
    }
    
    init() {}
}
