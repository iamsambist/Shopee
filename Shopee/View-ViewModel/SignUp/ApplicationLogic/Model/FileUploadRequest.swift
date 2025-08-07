//
//  FileUploadRequest.swift
//  Shopee
//
//  Created by MacBook Two on 07/08/2025.
//

import Foundation

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
