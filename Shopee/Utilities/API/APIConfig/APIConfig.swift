//
//  APIConfig.swift
//  Shopee
//
//  Created by MacBook Two on 14/07/2025.
//

import Foundation


extension Data {
    
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
    
}
