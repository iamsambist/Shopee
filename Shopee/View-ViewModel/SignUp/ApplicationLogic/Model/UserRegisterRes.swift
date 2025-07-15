//
//  UserRegisterRes.swift
//  Shopee
//
//  Created by MacBook Two on 15/07/2025.
//

import Foundation

struct UserRegisterRes: Codable {
    
    let email: String
    let password: String
    let name: String
    let avatar: String
    let role: String
    let id: Int
    
}
