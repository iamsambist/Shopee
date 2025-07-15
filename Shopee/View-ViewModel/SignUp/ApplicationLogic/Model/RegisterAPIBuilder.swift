//
//  RegisterUserApi.swift
//  Shopee
//
//  Created by MacBook Two on 15/07/2025.
//

import Foundation

struct RegisterAPIBuilder: APIRequest {
    let user: UserParams
    
    var baseURL: BaseURL { .registerUser }
    
    var endpoint: APIEndpoint { .registerUser }
    
    var method: HTTPMethod { .POST }
    
    var headers: [String : String] { [:] }
    
    var body: Data? {
        try? JSONEncoder().encode(user)
    }
    
    
}
