//
//  Register.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 10.04.2021.
//

struct Register {
    let email, password, name, surname: String
    let age: Int
    let phone, sex: String
    
    init(email: String, password: String, name: String, surname: String, age: Int, phone: String, sex: String) {
        self.email = email
        self.password = password
        self.name = name
        self.surname = surname
        self.age = age
        self.phone = phone
        self.sex = sex
    }
}
