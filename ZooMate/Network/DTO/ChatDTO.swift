//
//  ChatDTO.swift
//  ZooMate
//
//  Created by Song Kim on 6/10/25.
//

import Foundation

// 채팅방 생성
struct AddChatRoomResponse: Codable {
    let message: String
    let data: AddChatRoom
}

struct AddChatRoom: Codable {
    let id: Int
    let createdAt: String
}

// 채팅방 리스트
struct ChatRoomResponse: Codable {
    let id: Int
    let createdAt: String
    var pets: [ChatRoomPetList]
}

struct ChatRoomPetList: Codable {
    let roomId: Int
    let joinedAt: String
    let pet: ChatRoomPet
}

struct ChatRoomPet: Codable {
    let id: Int
    let petName: String
    let photos: [String]
    let ownerId: Int
}

struct MessageResponse: Codable {
    let id: Int
    let roomId: Int
    let senderPetId: Int
    let content: String
    let sendMSGAt: String
    let isRead: Bool
    let pet: ChatRoomPet
}
