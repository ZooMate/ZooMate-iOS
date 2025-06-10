//
//  MateDTO.swift
//  ZooMate
//
//  Created by Song Kim on 6/10/25.
//

import Foundation

// 찜 등록, 삭제
struct MateResponse: Codable {
    let message: String
}

// 찜한 펫 목록 조회
struct MatePetListResponse: Codable {
    let message: String
    let data: [PetList]
}

struct MatePetStatus: Codable {
    let message: String
    let liked: Bool
}

// 찜한 펫 디테일
struct MatePetDetailResponse: Codable {
    let message: String
    let data: PetDetail
}
