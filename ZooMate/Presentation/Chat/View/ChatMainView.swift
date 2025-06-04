//
//  ChatMainView.swift
//  ZooMate
//
//  Created by Song Kim on 5/27/25.
//

import SwiftUI

struct ChatMainView: View {
    @StateObject private var data = DummyData2()
    @StateObject private var data2 = DummyData1()
    
    private var filteredChatRooms: [ChatRoom] {
        data.chatRooms.filter { $0.pets.contains{ $0.ownerId == MyData.shared.myId} }
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    List {
                        ForEach(filteredChatRooms) { chatRoom in
                            let pet = chatRoom.pets.first(where: { $0.ownerId != MyData.shared.myId })!
                            let chat = getMessages(for: chatRoom.id)
                            let name = getUserName(for: pet)
                            ZStack {
                                ChatRoomCell(pet: pet, chat: chat, senderUserName: name)
                                NavigationLink(destination: MessageListView(message: chat)) {
                                    EmptyView()
                                }
                                .opacity(0)
                                .buttonStyle(PlainButtonStyle())
                            }
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listStyle(PlainListStyle())
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle("채팅")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func getMessages(for roomId: Int) -> [Message] {
        let messages = data.messages.filter{ $0.roomId == roomId }.map{ $0 }
        return messages
    }
    
    private func getUserName(for pet: Pet) -> String {
        let user = data2.dummyUsers.first(where: { $0.id == pet.ownerId })
        return user?.userName ?? "이름정보없음"
    }
}

#Preview {
    ContentView()
}
