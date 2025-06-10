//
//  UserResponse.swift
//  ZooMate
//
//  Created by Song Kim on 6/5/25.
//

import Foundation

struct MyInfoDataResponse: Codable {
    let message: String
    let data: MyInfoData
}

struct MyInfoData: Codable {
    let id: Int
    let userId: String
    let userName: String
    let region: String
    let userDesc: String?
    let profile: String?
}

struct DeleteUserResponse: Codable {
    let message: String
}
