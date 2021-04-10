//
//  ApiProvider.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 10.04.2021.
//

class ApiProvider {
    static let shared = APIDataProvider(storage: InterceptorInterface())
}
