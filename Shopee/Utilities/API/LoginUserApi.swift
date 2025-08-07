//
//  LoginUserApi.swift
//  Shopee
//
//  Created by MacBook Two on 07/08/2025.
//


import Foundation
import Combine
import Alamofire




protocol LoginUserApi {
    
    func loginUser(email: String, password: String) -> AnyPublisher<LoginResponse, Error>
    
}

extension LoginUserApi {
    
    func loginUser(email: String, password: String) -> AnyPublisher<LoginResponse, Error> {
        let urlRequest = UserLoginRequest(email: email, password: password).asURLRequest()
        print(urlRequest)
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .tryMap { response in
                print("RESPONSE: \(response)")
                return response
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
