//
//  ChatRoomCell.swift
//  ZooMate
//
//  Created by Song Kim on 5/27/25.
//

import SwiftUI
import Kingfisher

struct ChatRoomCell: View {
    let pet: Pet
    let chat: [Message]
    let senderUserName: String
    
    var body: some View {
        HStack {
            KFImage(URL(string: pet.photos[0]))
                .resizable()
                .frame(width: 90, height: 90)
                .clipShape(.circle)
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                Text("\(senderUserName) | \(pet.petName)")
                    .font(.notoSansMedium(size: 16))
                    .padding(.bottom, 1)
                    .foregroundStyle(.mainText)
                Text("\(chat.last?.content ?? "")")
                    .font(.notoSansMedium(size: 12))
                    .foregroundStyle(.subText)
            }
            Spacer()
            VStack(alignment: .trailing) {
                let date = timeFormatter.string(from: chat.last!.sendMsgAt)
                Text(date)
                    .font(.notoSansMedium(size: 12))
                    .foregroundStyle(.subText)
                    .padding(.bottom, 2)
                let count = chat.filter{!$0.isRead && $0.senderPetId != MyData.shared.myId}.count
                if count > 0 {
                    Text("\(count)")
                        .font(.notoSansMedium(size: 12))
                        .foregroundStyle(.subText)
                        .padding(.horizontal, 5)
                        .background(.sandBeige)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
        .background(.clear)
    }
}

//#Preview {
//    ChatRoomCell()
//}
