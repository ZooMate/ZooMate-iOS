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

struct ChatRoomResponse: Codable {
    let roomId: Int
    let opponentPet: OpponentPet
    let lastMessage: ChatRoomListMsg
}

struct ChatRoomListMsg: Codable {
    let senderPetId: Int
    let content: String
    let sendMSGAt: String
    let isRead: Bool
    let userName: String
}

struct OpponentPet: Codable {
    let id: Int
    let petName: String
    let photos: [String]
    let ownerId: Int
}

struct ChatRoomPet: Codable {
    let id: Int
    let petName: String
    let photos: [String]
    let ownerId: Int
    let owner: Owner
}

struct Owner: Codable {
    let userName: String
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
