//
//  BaseResponse.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 10.04.2021.
//

import Foundation
public struct BaseResponse<T: Decodable>: Decodable {
    public let success: Bool
    public let message: String?
    public let data: T?
}
