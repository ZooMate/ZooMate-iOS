//
//  Chat.swift
//  ZooMate
//
//  Created by Song Kim on 5/22/25.
//

import SwiftUI

// MARK: - ChatRoom
struct ChatRoom: Codable, Identifiable {
    var id: Int
    var firstPetId: Int
    var secondPetId: Int
    var createdAt: Date
}

// MARK: - Message
struct Message: Codable, Identifiable {
    var id: Int
    let senderPetId: Int
    var roomId: Int
    var content: String
    var sendMsgAt: Date
    var isRead: Bool
}
