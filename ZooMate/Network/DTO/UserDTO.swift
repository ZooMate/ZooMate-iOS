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
    let id: Int             // 사용자 고유 ID
    var userId: String
    var userName: String            // 사용자 이름
    var userPassword: String            // 사용자 암호
    var region: String              // 사용자 지역(구)
    var userDesc: String?               // 사용자 소개글
    var profile: String?            // 프로필 이미지 URL
}
