//
//  APIRoutes.swift
//  Shopee
//
//  Created by MacBook Two on 11/07/2025.
//


import Foundation
import Alamofire

enum ApiRoutes: URLRequestConvertible {
    
    case fetchImages(searchKey: String)
    
    // MARK: - BASE URL
    var baseUrl: String {
        switch self {
        case .fetchImages:
            return "https://pixabay.com/api/"
        }
    }
    // MARK: - METHOD
    var method : HTTPMethod {
        switch self {
        case .fetchImages:
            return .get
        }
    }
    
    // MARK: - PARAMETERS
    var parameters : Parameters? {
        switch self {
        case .fetchImages(searchKey: let searchKey):
            return [
                "key": "47312294-5f9b6042c846d4d3f861c610e",
                "q": searchKey,
                "page": 1,
                "per_page": 5
            ]
        }
    }
    
  
    func asURLRequest() throws -> URLRequest {
      
        guard let url = URL(string: baseUrl) else { throw AFError.invalidURL(url: baseUrl) }
        
       
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        
        if let parameters = parameters {
                  switch method {
                  case .get:
                    
                      urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                  default:
                    
                      urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
                  }
              }
        return urlRequest
    }
}
