//
//  ResSplashImg.swift
//  100ps
//
//  Created by Sunil on 30/06/2025.
//

import Foundation

struct ResponseSplashImage : Codable {
    
    let total : Int?
    let totalHits : Int?
    let hits : [SplashImageData]?

}

struct SplashImageData : Codable, Identifiable {
    
    let id : Int?
    let pageURL : String?
    let type : String?
    let tags : String?
    let previewURL : String?
    let previewWidth : Int?
    let previewHeight : Int?
    let webformatURL : String?
    let webformatWidth : Int?
    let webformatHeight : Int?
    let largeImageURL : String?
    let imageWidth : Int?
    let imageHeight : Int?
    let imageSize : Int?
    let views : Int?
    let downloads : Int?
    let collections : Int?
    let likes : Int?
    let comments : Int?
    let user_id : Int?
    let user : String?
    let userImageURL : String?
    let noAiTraining : Bool?
    let isAiGenerated : Bool?
    let isGRated : Bool?
    let isLowQuality : Int?
    let userURL : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case pageURL = "pageURL"
        case type = "type"
        case tags = "tags"
        case previewURL = "previewURL"
        case previewWidth = "previewWidth"
        case previewHeight = "previewHeight"
        case webformatURL = "webformatURL"
        case webformatWidth = "webformatWidth"
        case webformatHeight = "webformatHeight"
        case largeImageURL = "largeImageURL"
        case imageWidth = "imageWidth"
        case imageHeight = "imageHeight"
        case imageSize = "imageSize"
        case views = "views"
        case downloads = "downloads"
        case collections = "collections"
        case likes = "likes"
        case comments = "comments"
        case user_id = "user_id"
        case user = "user"
        case userImageURL = "userImageURL"
        case noAiTraining = "noAiTraining"
        case isAiGenerated = "isAiGenerated"
        case isGRated = "isGRated"
        case isLowQuality = "isLowQuality"
        case userURL = "userURL"
    }

}
