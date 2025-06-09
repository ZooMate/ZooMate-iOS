//
//  ChatDTO.swift
//  ZooMate
//
//  Created by Song Kim on 6/10/25.
//

import Foundation

// 채팅방 생성 -> 중복생성되는거같다
struct AddChatRoomResponse: Codable {
    let message: String
    let data: AddChatRoom
}

struct AddChatRoom: Codable {
    let id: Int
    let createdAt: String
}

