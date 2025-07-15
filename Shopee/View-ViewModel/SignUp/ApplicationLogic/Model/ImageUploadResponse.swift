//
//  ImageUploadResponse.swift
//  Shopee
//
//  Created by MacBook Two on 14/07/2025.
//

import Foundation

struct GofileUploadResponse: Codable {
    
    let status: String
    let data: FileData
    
}

struct FileData: Codable {
    
    let createTime: Int
    let downloadPage: String
    let guestToken: String
    let id: String
    let md5: String
    let mimetype: String
    let modTime: Int
    let name: String
    let parentFolder: String
    let parentFolderCode: String
    let servers: [String]
    let size: Int
    let type: String
    
}
