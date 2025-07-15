////
////  Test.swift
////  Shopee
////
////  Created by MacBook Two on 14/07/2025.
////
//
//import Foundation
//import Foundation
//import UIKit
//
//class NetworkManagers {
//    static let shared = NetworkManagers()
//    let loadingStateManager = LoadingStateManager.shared
//
//    private init() {}
//
//    func performRequest<T: Decodable>( endpoint: APIEndPoint, body: Data? = nil) async throws -> T {
//        let loadingId = loadingStateManager.startLoading(withMessage: "Loading \(endpoint.path.split(separator: "/").last ?? "")...")
//        var urlComponents = URLComponents(string: APIConfig.baseURL + endpoint.path)!
//        if let queryItems = endpoint.queryItems {
//            urlComponents.queryItems = queryItems
//        }
//
//        guard let url = urlComponents.url else {
//            loadingStateManager.stopLoading(for: loadingId)
//            throw APIError.badUrl
//        }
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = endpoint.method.rawValue
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.httpBody = body
//
//        print("Request URL: \(url)")
//        if let body = body, let bodyString = String(data: body, encoding: .utf8) {
//            print("Request Body: \(bodyString)")
//        }
//
//        let session = URLSession(configuration: .default)
//        loadingStateManager.updateProgress(to: 0.1, for: loadingId)
//
//        do {
//            let (data, response) = try await session.data(for: urlRequest)
//            loadingStateManager.updateProgress(to: 0.7, for: loadingId)
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200...299).contains(httpResponse.statusCode) else {
//                throw APIError.badStatus
//            }
//                        print("Status \( (response as? HTTPURLResponse)?.statusCode ?? -1 )")
//                        if let responseBody = String(data: data, encoding: .utf8) {
//                            print("Body:", responseBody)
//                        }
//            do {
//                loadingStateManager.updateProgress(to: 0.9, for: loadingId)
//                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
//                loadingStateManager.updateProgress(to: 1.0, for: loadingId)
//                try? await Task.sleep(nanoseconds: 300_000_000) // 0.3 seconds
//                loadingStateManager.stopLoading(for: loadingId)
//                return decodedResponse
//            } catch let decodingError as DecodingError {
//                print("Decoding error:", decodingError)
//                loadingStateManager.stopLoading(for: loadingId)
//
//                switch decodingError {
//                case .keyNotFound(let key, let context):
//                    print("Key '\(key.stringValue)' not found:", context.debugDescription)
//                    print("codingPath:", context.codingPath)
//                case .valueNotFound(let type, let context):
//                    print("Value not found for type '\(type)':", context.debugDescription)
//                    print("codingPath:", context.codingPath)
//                case .typeMismatch(let type, let context):
//                    print("Type mismatch for type '\(type)':", context.debugDescription)
//                    print("codingPath:", context.codingPath)
//                case .dataCorrupted(let context):
//                    print("Data corrupted:", context.debugDescription)
//                    print("codingPath:", context.codingPath)
//                @unknown default:
//                    print("Unknown decoding error:", decodingError)
//                }
//                throw decodingError
//            } catch {
//                loadingStateManager.stopLoading(for: loadingId)
//                print("Other error:", error.localizedDescription)
//                throw error
//            }
//        } catch {
//            loadingStateManager.stopLoading(for: loadingId)
//            throw error
//        }
//    }
//
//    func tokenRequest<T: Decodable>(endpoint: APIEndPoint, body: Data? = nil) async throws -> T {
//        let loadingId = loadingStateManager.startLoading(withMessage: "Loading \(endpoint.path.split(separator: "/").last ?? "")...")
//        var urlComponents = URLComponents(string: APIConfig.baseURL + endpoint.path)!
//        if let queryItems = endpoint.queryItems {
//            urlComponents.queryItems = queryItems
//        }
//        guard let url = urlComponents.url else {
//            loadingStateManager.stopLoading(for: loadingId) // Stop loading if bad URL
//            throw APIError.badUrl
//        }
//        guard let token = KeychainManager.shared.read(key: "token") else {
//            loadingStateManager.stopLoading(for: loadingId)
//            print("Error: Token is missing in keychain.")
//            throw APIError.unauthorized
//        }
//        // Create the URLRequest
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = endpoint.method.rawValue
//        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type") // Add Content-Type header
//        urlRequest.httpBody = body
//
//        print("Request URL: \(url)")
//        let session = URLSession(configuration: .default)
//        loadingStateManager.updateProgress(to: 0.1, for: loadingId)
//
//        do {
//            let (data, response) = try await session.data(for: urlRequest)
//            loadingStateManager.updateProgress(to: 0.7, for: loadingId)
//            if let httpResponse = response as? HTTPURLResponse {
////                                print("Response Status Code: \(httpResponse.statusCode)")
////                                print("Response Headers: \(httpResponse.allHeaderFields)")
//            }
//
//            if let responseString = String(data: data, encoding: .utf8) {
////                                print("Response Body: \(responseString)")
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200...299).contains(httpResponse.statusCode) else {
//                if let httpResponse = response as? HTTPURLResponse {
//                    print("Bad status code: \(httpResponse.statusCode)")
//
//                    do {
//                        let errorResponse = try JSONDecoder().decode(UpdateUserProfileResponse.self, from: data)
//                        if let errors = errorResponse.errors {
//                            print("Server errors: \(errors)")
//                        }
//                        if let data = errorResponse.data, data is [String] {
////                            print("Error data: \(data)")
//                        }
//                    } catch {
//                        print("Could not decode error response: \(error)")
//                    }
//                }
//
//                loadingStateManager.stopLoading(for: loadingId)
//                throw APIError.badStatus
//            }
//
//            do {
//                loadingStateManager.updateProgress(to: 0.9, for: loadingId)
//                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
//                loadingStateManager.updateProgress(to: 1.0, for: loadingId)
//                try? await Task.sleep(nanoseconds: 300_000_000) // 0.3 seconds
//                loadingStateManager.stopLoading(for: loadingId)
//                return decodedResponse
//            } catch let decodingError as DecodingError {
//                print("Decoding error:", decodingError)
//                loadingStateManager.stopLoading(for: loadingId)
//
//                switch decodingError {
//                case .keyNotFound(let key, let context):
//                    print("Key '\(key.stringValue)' not found:", context.debugDescription)
//                    print("codingPath:", context.codingPath)
//                case .valueNotFound(let type, let context):
//                    print("Value not found for type '\(type)':", context.debugDescription)
//                    print("codingPath:", context.codingPath)
//                case .typeMismatch(let type, let context):
//                    print("Type mismatch for type '\(type)':", context.debugDescription)
//                    print("codingPath:", context.codingPath)
//                case .dataCorrupted(let context):
//                    print("Data corrupted:", context.debugDescription)
//                    print("codingPath:", context.codingPath)
//                @unknown default:
//                    print("Unknown decoding error:", decodingError)
//                }
//                throw decodingError
//            } catch {
//                loadingStateManager.stopLoading(for: loadingId)
//                print("Other error:", error.localizedDescription)
//                throw error
//            }
//        } catch {
//            loadingStateManager.stopLoading(for: loadingId)
//            throw error
//        }
//    }
//
//    func multipartFormData<T: Decodable>(
//        endpoint: APIEndPoint,
//        image: UIImage,
//        fieldName: String = "file",
//        fileName: String = "profile.jpg"
//    ) async throws -> T {
//        let loadingId = loadingStateManager.startLoading(withMessage: "Processing request...")
//        var urlComponents = URLComponents(string: APIConfig.baseURL + endpoint.path)!
//        if let queryItems = endpoint.queryItems {
//            urlComponents.queryItems = queryItems
//        }
//        guard let url = urlComponents.url else {
//            loadingStateManager.stopLoading(for: loadingId)
//            throw APIError.badUrl
//        }
//        // Read token
//        guard let token = KeychainManager.shared.read(key: "token") else {
//            loadingStateManager.stopLoading(for: loadingId)
//            throw APIError.unauthorized
//        }
//
//        loadingStateManager.stopLoading(for: loadingId)
//        // Convert UIImage to JPEG
//        guard let imageData = image.jpegData(compressionQuality: 0.9) else {
//            loadingStateManager.stopLoading(for: loadingId)
//            throw APIError.unauthorized
//        }
//        // Create boundary
//        let boundary = "Boundary-\(UUID().uuidString)"
//        // Build the HTTP body as multipart/form-data
//        var body = Data()
//        // Opening boundary
//        body.append("--\(boundary)\r\n".data(using: .utf8)!)
//        // Content-Disposition (the form field must match what the server expects)
//        body.append("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
//        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
//        body.append(imageData)
//        body.append("\r\n".data(using: .utf8)!)
//        // Closing boundary
//        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
//        // Create the URLRequest
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = endpoint.method.rawValue
//        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        urlRequest.httpBody = body
//
//        print("Request URL: \(url)")
//
//        let (data, response) = try await URLSession.shared.data(for: urlRequest)
//
//        print("Response of the imahe\(response)")
//        guard let httpResponse = response as? HTTPURLResponse,
//              httpResponse.statusCode == 200 else {
//            throw APIError.badStatus
//        }
//
//        do {
//            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
//            return decodedResponse
//        } catch {
//            print("Decode error:", error)
//            throw error
//        }
//    }
//}
