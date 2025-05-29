//
//  User.swift
//  ZooMate
//
//  Created by Song Kim on 5/22/25.
//

import SwiftUI

// MARK: - 사용자 정보
struct User: Codable {
    let id: Int             // 사용자 고유 ID
    var userId: String
    var userName: String            // 사용자 이름
    var password: String            // 사용자 암호
    var region: String?             // 사용자 지역(구)
    var desc: String?               // 사용자 소개글
    var pets: [Pet]?                // 사용자가 보유한 반려동물 목록
    var profile: String?            // 프로필 이미지 URL
}
