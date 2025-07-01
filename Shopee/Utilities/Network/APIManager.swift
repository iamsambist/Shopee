//
//  APIManager.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//

import Foundation
import Alamofire

final class APIManager {
    
    static let shared = APIManager()
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        configuration.waitsForConnectivity = true
        
        
        return Session(
            configuration: configuration
        )
    }()
    
}
