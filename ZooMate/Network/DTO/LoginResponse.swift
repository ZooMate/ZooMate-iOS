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
