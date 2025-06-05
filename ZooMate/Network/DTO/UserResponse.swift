//
//  UserResponse.swift
//  ZooMate
//
//  Created by Song Kim on 6/5/25.
//

import SwiftUI

struct UserResponse: Codable {
    let id: Int
    let userId: String
    let userName: String
    let userPassword: String
    let region: String
    let userDesc: String?
    let profile: String?
}
