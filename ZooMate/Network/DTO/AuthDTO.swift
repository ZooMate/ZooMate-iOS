//
//  LoginResponse.swift
//  ZooMate
//
//  Created by Song Kim on 6/5/25.
//

import SwiftUI

struct LoginResponse: Decodable {
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}

struct CheckIdResponse: Codable {
    let isTaken: Bool
}

struct SignupRequest: Encodable {
    var userId: String
    var userName: String
    var userPassword: String
    var region: String
    var userDesc: String
    var profile: Data
}

struct SignupResponse: Decodable {
    let id: Int
    let userId: String
    let userName: String
    let userPassword: String
    let region: String
    let userDesc: String
    let profile: String
}

struct PasswordResponse: Codable {
    let message: String
}
