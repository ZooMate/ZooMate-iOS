//
//  Untitled.swift
//  ZooMate
//
//  Created by Song Kim on 5/23/25.
//

import SwiftUI

class DummyData2: ObservableObject {
    let chatRooms: [ChatRoom] = [
        ChatRoom(id: 1, firstPetId: 1, secondPetId: 6, createdAt: Date()),
            ChatRoom(id: 2, firstPetId: 2, secondPetId: 6, createdAt: Date().addingTimeInterval(-86400)),
            ChatRoom(id: 3, firstPetId: 3, secondPetId: 6, createdAt: Date().addingTimeInterval(-172800)),
            ChatRoom(id: 4, firstPetId: 4, secondPetId: 6, createdAt: Date().addingTimeInterval(-259200)),
            ChatRoom(id: 5, firstPetId: 5, secondPetId: 6, createdAt: Date().addingTimeInterval(-345600)),
        ]
        
        let messages: [Message] = [
            // 1
            Message(id: 1, senderPetId: 1, roomId: 1, content: "안녕하세요! 산책 자주 가세요?", sendMsgAt: Date().addingTimeInterval(-7200), isRead: true), // 2시간 전
            Message(id: 2, senderPetId: 6, roomId: 1, content: "네! 아침마다 공원에 가요 😊", sendMsgAt: Date().addingTimeInterval(-7150), isRead: true),
            Message(id: 11, senderPetId: 1, roomId: 1, content: "와! 우리도 자주 가는데 혹시 도그파크?", sendMsgAt: Date().addingTimeInterval(-7000), isRead: true),
            Message(id: 12, senderPetId: 6, roomId: 1, content: "맞아요! 도그파크 자주 가요 🐶", sendMsgAt: Date().addingTimeInterval(-6950), isRead: true),
            Message(id: 13, senderPetId: 1, roomId: 1, content: "그럼 거기서 봤을 수도 있겠네요!", sendMsgAt: Date().addingTimeInterval(-6800), isRead: true),
            Message(id: 14, senderPetId: 6, roomId: 1, content: "다음엔 인사할게요 😄", sendMsgAt: Date().addingTimeInterval(-6750), isRead: true),
            Message(id: 15, senderPetId: 1, roomId: 1, content: "조아요", sendMsgAt: Date().addingTimeInterval(-6800), isRead: false),
            Message(id: 16, senderPetId: 1, roomId: 1, content: "아주조아요~", sendMsgAt: Date().addingTimeInterval(-6800), isRead: false),
            
            // 2
            Message(id: 3, senderPetId: 2, roomId: 2, content: "오늘 산책 다녀왔어요!", sendMsgAt: Date().addingTimeInterval(-90000), isRead: true),
            Message(id: 4, senderPetId: 6, roomId: 2, content: "좋아요! 어디 다녀왔나요?", sendMsgAt: Date().addingTimeInterval(-88000), isRead: false),
            
            // 3
            Message(id: 5, senderPetId: 3, roomId: 3, content: "우리 강아지 새 옷 샀어요.", sendMsgAt: Date().addingTimeInterval(-170000), isRead: true),
            Message(id: 6, senderPetId: 6, roomId: 3, content: "멋지네요! 사진 보여주세요.", sendMsgAt: Date().addingTimeInterval(-169000), isRead: false),
            
            // 4
            Message(id: 7, senderPetId: 4, roomId: 4, content: "강아지 훈련 잘 되고 있나요?", sendMsgAt: Date().addingTimeInterval(-258000), isRead: true),
            Message(id: 8, senderPetId: 6, roomId: 4, content: "네! 조금씩 배우고 있어요.", sendMsgAt: Date().addingTimeInterval(-257000), isRead: true),
            
            // 5
            Message(id: 9, senderPetId: 5, roomId: 5, content: "우리 강아지 놀러 올래요?", sendMsgAt: Date().addingTimeInterval(-344000), isRead: true),
            Message(id: 10, senderPetId: 6, roomId: 5, content: "네, 좋아요! 일정 잡아봐요.", sendMsgAt: Date().addingTimeInterval(-343000), isRead: true),
        ]
}
