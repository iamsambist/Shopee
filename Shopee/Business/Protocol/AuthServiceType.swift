//
//  AuthServiceType.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//

import Foundation
import Combine
import Alamofire

protocol AuthServiceType {
    func fetchSplashImages() -> AnyPublisher<ResponseSplashImage, AFError>
   
}

extension AuthServiceType {
    
    
    
    func fetchSplashImages() -> AnyPublisher<ResponseSplashImage, AFError> {
    
        let sessionManager = APIManager.shared.sessionManager
        let requestString = "https://pixabay.com/api/"
        let requestURl = URL(string: requestString)!
        
        let parameters: Parameters = [
            "q":"girls Shopping",
            "key":"47312294-5f9b6042c846d4d3f861c610e",
            "order":"popular"
        ] as [String : String]
    
        return AF.request(requestURl, method: .get, parameters: parameters)
            .validate().publishDecodable(type: ResponseSplashImage.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            
    }
}
