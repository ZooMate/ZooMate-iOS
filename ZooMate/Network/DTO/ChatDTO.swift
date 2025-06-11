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
    let isCreated: Bool
    let roomId: Int
}

struct ChatRoomResponse: Codable, Identifiable {
    let roomId: Int
    let opponentPet: OpponentPet
    let myPetId: Int
    let userName: String
    let lastMessage: ChatRoomListMsg?
    
    var id: Int { roomId }  // Identifiable이 요구하는 id 제공
}

struct ChatRoomListMsg: Codable {
    let senderPetId: Int
    let content: String
    let sendMSGAt: String
    let isRead: Bool
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

struct MessageResponse: Codable, Identifiable {
    let id: Int
    let roomId: Int
    let senderPetId: Int
    let content: String
    var sendMSGAt: String
    let isRead: Bool
    let pet: ChatRoomPet
}

struct SendMessageResponse: Codable {
    let id: Int
    let roomId: Int
    let senderPetId: Int
    let content: String
    let sendMSGAt: String
    let isRead: Bool
    let pet: SendMSGPet
}

struct SendMSGPet: Codable {
    let id: Int
    let petName: String
}
