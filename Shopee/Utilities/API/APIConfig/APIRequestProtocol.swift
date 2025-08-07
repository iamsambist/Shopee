//
//  APIRequestProtocol.swift
//  Shopee
//
//  Created by MacBook Two on 14/07/2025.
//

import Foundation

protocol APIRequest {
    
    var baseURL: BaseURL { get }
    var endpoint: APIEndpoint { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var body: Data? { get }
    
}

enum BaseURL: String {
    
    case photoUpload = "https://upload.gofile.io/"
    
    case registerUser = "https://api.escuelajs.co/"
    
}
enum APIEndpoint: String {
    
    case photoUpload = "uploadFile"
    case registerUser = "api/v1/users/"
    case loginUser = "api/v1/auth/login"
    
}

enum HTTPMethod: String {
    
    case GET, POST, PUT, DELETE
    
}

struct APIHeaders {
    
    static let json: [String: String] = [
        "Content-Type": "application/json",
        "Accept": "application/json"
    ]
    
    static let multipart: [String: String] = [
        "Content-Type": "multipart/form-data"
    ]
    
}

struct RegisterUserRequest: Codable {
    
    let username: String
    let email: String
    let password: String
    
}

extension APIRequest {
    
    func asURLRequest() -> URLRequest {
        let url = URL(string: baseURL.rawValue + endpoint.rawValue)!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        request.httpBody = body
        return request
    }
    
}

extension URLRequest {
    
    var curlString: String {
        var command = "curl -X \(self.httpMethod ?? "GET") '\(self.url!.absoluteString)'"
        for (key, value) in self.allHTTPHeaderFields ?? [:] {
            command += " \\\n  -H '\(key): \(value)'"
        }
        if let body = self.httpBody, let bodyString = String(data: body, encoding: .utf8) {
            command += " \\\n  -d '\(bodyString)'"
        }
        return command
    }
    
}




