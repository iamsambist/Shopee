//
//  Request.swift
//  Shopee
//
//  Created by MacBook Two on 07/08/2025.
//

import Foundation

struct UserLoginRequest: APIRequest {
    let email: String
    let password: String
    
    var baseURL: BaseURL { .registerUser }
    
    var endpoint: APIEndpoint { .loginUser }
    
    var method: HTTPMethod { .POST }
    
    var headers: [String : String] { APIHeaders.json }
    
    
    var body: Data? {
        
        let requestBody = [ "email": email, "password": password ]
        do {
            return try JSONSerialization.data(withJSONObject: requestBody, options: [])
        } catch {
            print("error serializing json \(error)")
            return nil
        }
    }
    
    
}
