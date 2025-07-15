//
//  RegisterUserApi.swift
//  Shopee
//
//  Created by MacBook Two on 15/07/2025.
//

import Foundation
import Combine

protocol RegisterUserApi {
   
    func registerUser(with request: UserParams) -> AnyPublisher<UserRegisterRes, Error>
    
}

extension RegisterUserApi {
    
    func registerUser(with request: UserParams) -> AnyPublisher<UserRegisterRes, Error> {
        return APIManager.shared.sessionManager
             .request(ApiRoutes.registerUser(user: request))
             .validate()
             .publishDecodable(type: UserRegisterRes.self)
             .value()
             .tryMap { response in
                 print("RESPONSE: \(response)")
                 return response
             }
             .eraseToAnyPublisher()
    }
   
}


