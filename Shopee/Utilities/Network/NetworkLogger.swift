//
//  NetworkLogger.swift
//  Shopee
//
//  Created by MacBook Two on 11/07/2025.
//

import Foundation
import Alamofire

final class NetworkLogger: EventMonitor {
  let queue = DispatchQueue(label: "com.alpas.myconnect.networklogger")

  func requestDidFinish(_ request: Request) {
    print("REQUEST" ,request)
  }

  func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
    guard let data = response.data else {
      return
    }
    if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
      print("RESPONSE", json)
    }
  }
}
