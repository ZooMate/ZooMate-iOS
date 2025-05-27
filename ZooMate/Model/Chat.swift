//
//  Chat.swift
//  ZooMate
//
//  Created by Song Kim on 5/22/25.
//

import SwiftUI

// MARK: - ChatRoom
struct ChatRoom: Codable, Identifiable {
    var id: String { roomId }
    let roomId: String
    var firstPetId: String
    var secondPetId: String
    var createdAt: Date
}

// MARK: - Message
struct Message: Codable, Identifiable {
    var id: String {msgId}
    let msgId: String
    let senderPetId: String
    var roomId: String
    var content: String
    var sendMsgAt: Date
    var isRead: Bool
}
