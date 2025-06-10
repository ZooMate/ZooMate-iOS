//
//  ChatMainView.swift
//  ZooMate
//
//  Created by Song Kim on 5/27/25.
//

import SwiftUI

struct ChatMainView: View {
    @ObservedObject var myData: MyData
    @Binding var chatRooms: [ChatRoomResponse]
    @State var isNavigating: Bool = false
    @State var messages: [MessageResponse] = []
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    List {
                        ForEach(chatRooms) { chatRoom in
                            ZStack {
                                Button {
                                    ChatNetwork.fetchChatRoomMessage(roomId: chatRoom.roomId) { result in
                                        switch result {
                                        case .success(let data):
                                            messages = data
                                            isNavigating  = true
                                        case .failure(let err):
                                            print(err)
                                        }
                                    }
                                } label: {
                                    ChatRoomCell(data: chatRoom)
                                }
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
            .navigationDestination(isPresented: $isNavigating) {
                MessageListView(myData: myData, messages: $messages)
            }
        }
    }
}
