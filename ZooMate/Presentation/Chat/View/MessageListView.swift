//
//  MessageListView.swift
//  ZooMate
//
//  Created by Song Kim on 5/27/25.
//

import SwiftUI

struct MessageListView: View {
    @ObservedObject var myData: MyData
    @Binding var messages: [MessageResponse]
    @Binding var chatRooms: [ChatRoomResponse]
    let roomId: Int
    let myPetId: Int
    @State var msg = ""
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                List {
                    ForEach($messages) { $m in
                        Group {
                            let time = DateFormatterManager.formattedTime(from: m.sendMSGAt) ?? "시간 오류"
                            
                            if m.senderPetId == myPetId {
                                SendMessageCell(text: m.content, time: time, isRead: true)
                            } else {
                                ReceiveMessageCell(text: m.content, time: time, isRead: true)
                            }
                        }
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .padding(.horizontal, 16)
                .scrollContentBackground(.hidden)
                
                HStack {
                    TextField("메시지 보내기", text: $msg)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .font(.notoSansRegular(size: 15))
                        .padding(10)
                        .padding(.horizontal, 5)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.sandBeige, lineWidth: 1)
                        )
                    Button {
                        if !msg.isEmpty {
                            ChatNetwork.sendChatMessage(roomId: roomId, senderPetId: myPetId, content: msg) { result in
                                switch result {
                                case .success(let data):
                                    ChatNetwork.fetchChatRoomMessage(roomId: data.roomId) { result in
                                        switch result {
                                        case .success(let data):
                                            messages = data
                                            self.msg = ""
                                        case .failure(let err):
                                            print(err)
                                        }
                                    }
                                    ChatNetwork.fetchMyChatRoom { result in
                                        switch result {
                                        case .success(let data):
                                            chatRooms = data
                                        case .failure(let err):
                                            print("패치 챗룸 데이터 \(err)")
                                        }
                                    }
                                    print(data)
                                case .failure(let err):
                                    print(err)
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "paperplane")
                            .bold()
                            .foregroundStyle(.mainText)
                    }
                }
                .padding(.horizontal, 17)
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}
