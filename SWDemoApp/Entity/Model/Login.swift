//
//  Login.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 10.04.2021.
//

public class Login: Decodable {
    let email: String
    let password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    enum CodingKeys: String, CodingKey {
        case email
        case password
    }
}
