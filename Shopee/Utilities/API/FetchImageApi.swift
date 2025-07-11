//
//  FetchImageApi.swift
//  Shopee
//
//  Created by MacBook Two on 11/07/2025.
//

import Foundation
import Combine
import Alamofire




protocol FetchImageAPi {
    
    func fetchSplashImages(searchKey: String) -> AnyPublisher<[SplashImageData], Error>
    
}

extension FetchImageAPi {
    
    func fetchSplashImages(searchKey: String) -> AnyPublisher<[SplashImageData], Error> {
      
       return APIManager.shared.sessionManager
            .request(ApiRoutes.fetchImages(searchKey: searchKey))
            .validate()
            .publishDecodable(type: ResponseSplashImage.self)
            .value()
            .tryMap { response in
                guard let hits = response.hits else {
                    throw URLError(.badServerResponse)
                }
                return hits
            }
            .eraseToAnyPublisher()
    }
    
}
