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
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    List {
                        let filteredChatRooms = data.chatRooms.filter { $0.firstPetId == MyData.myId || $0.secondPetId == MyData.myId }
                        
                        ForEach(filteredChatRooms) { chatRoom in
                            let pet = getPet(by: chatRoom.firstPetId == MyData.myId ? chatRoom.secondPetId : chatRoom.firstPetId)
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
    
    private func getPet(by petId: Int) -> Pet {
        let pet = data2.dummyPets.first(where: { $0.id == petId })
        return pet ?? Pet(id: 0, petName: "", age: 0, gender: .female, isNeutering: true, isPublic: true, tag: [], photos: [], category: .bird, ownerId: 0)
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
