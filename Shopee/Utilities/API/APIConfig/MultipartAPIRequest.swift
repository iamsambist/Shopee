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



struct FileUploadRequest: MultipartAPIRequest {
    
    let fileData: Data
    let fileName: String
    let mimeType: String
    let token: String? // Optional API key or server info
    
    var baseURL: BaseURL { .photoUpload }
    var endpoint: APIEndpoint { .photoUpload }
    var method: HTTPMethod { .POST }
    
    var headers: [String: String] {
        return [:]
    }

    func body(boundary: String) -> Data? {
        var body = Data()

       
        if let token = token {
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"token\"\r\n\r\n")
            body.append("\(token)\r\n")
        }

        // 2. Add the file
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n")
        body.append("Content-Type: \(mimeType)\r\n\r\n")
        body.append(fileData)
        body.append("\r\n")

        // 3. Close boundary
        body.append("--\(boundary)--\r\n")
        
        return body
    }
    
}
