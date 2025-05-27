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
    let myId = "6"
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    List {
                        ForEach(data.chatRooms) { chatRoom in
                            if chatRoom.receiverPetId == myId {
                                let pet = getPet(by: chatRoom.senderPetId)
                                let chat = getMessages(for: chatRoom.roomId)
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
    
    private func getPet(by petId: String) -> Pet {
        let pet = data2.dummyPets.first(where: { $0.id == petId })
        return pet ?? Pet(petId: "", petName: "", age: 0, gender: .female, isNeutering: true, isPublic: true, tag: [], photos: [], category: .bird, ownerId: "")
    }
    
    private func getMessages(for roomId: String) -> [Message] {
        let messages = data.messages.filter{ $0.roomId == roomId }.map{ $0 }
        return messages
    }
    
    private func getUserName(for pet: Pet) -> String {
        let user = data2.dummyUsers.first(where: { $0.userId == pet.ownerId })
        return user?.userName ?? "이름정보없음"
    }
}

#Preview {
    ChatMainView()
}
