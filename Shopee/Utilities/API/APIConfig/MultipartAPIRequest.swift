//
//  MultipartAPIRequest.swift
//  Shopee
//
//  Created by MacBook Two on 14/07/2025.
//

import Foundation

protocol MultipartAPIRequest {
    
    var baseURL: BaseURL { get }
    var endpoint: APIEndpoint { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    func body(boundary: String) -> Data?
    
}

extension MultipartAPIRequest {
    
    func asURLRequest() -> URLRequest {
        let boundary = "Boundary-\(UUID().uuidString)"
        let fullURL = URL(string: baseURL.rawValue + endpoint.rawValue)!
        
        var request = URLRequest(url: fullURL)
        request.httpMethod = method.rawValue
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        request.httpBody = body(boundary: boundary)
        
        return request
    }
    
}




