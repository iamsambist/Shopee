//
//  NetworkError.swift
//  Shopee
//
//  Created by MacBook Two on 01/07/2025.
//

import Foundation

struct NetworkError: Error {
    let initialError: Error
    let backendError: Error?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
