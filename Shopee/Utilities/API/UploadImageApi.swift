//
//  UploadImageApi.swift
//  Shopee
//
//  Created by MacBook Two on 15/07/2025.
//

import Foundation
import Combine




protocol UploadImageApi {
    
    func uploadImageData(with request:URLRequest) -> AnyPublisher<FileData, Error>
    
}

extension UploadImageApi {
    
    func uploadImageData(with request: URLRequest) -> AnyPublisher<FileData, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: GofileUploadResponse.self, decoder: JSONDecoder())
            .tryMap { response in
                print("RESPONSE: \(response)")
                return response.data
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
