//
//  Decodable+Extension.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 9.04.2021.
//

import Alamofire

extension Decodable {
    static func decode(_ data: Data) -> Self? {
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .deferredToData
        return try? decoder.decode(self, from: data)
    }
}
