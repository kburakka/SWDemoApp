//
//  ApiError.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 9.04.2021.
//

import Foundation

public struct ApiError: Error, Decodable {
    public let code: String?
    public let title: String?
    public let message: String?
}
