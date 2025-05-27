//
//  MessageListView.swift
//  ZooMate
//
//  Created by Song Kim on 5/27/25.
//

import SwiftUI

struct MessageListView: View {
    let message: [Message]
    let myId = "6"
    @State var msg = ""
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                List {
                    ForEach(message) { m in
                        Group {
                            if m.senderPetId == myId {
                                SendMessageCell(text: m.content, time: timeFormatter.string(from: m.sendMsgAt), isRead: m.isRead)
                            } else {
                                ReceiveMessageCell(text: m.content, time: timeFormatter.string(from: m.sendMsgAt), isRead: m.isRead)
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
