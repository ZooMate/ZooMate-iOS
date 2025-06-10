//
//  ChatRoomCell.swift
//  ZooMate
//
//  Created by Song Kim on 5/27/25.
//

import SwiftUI
import Kingfisher

struct ChatRoomCell: View {
    let data: ChatRoomResponse
    
    var body: some View {
        HStack {
            KFImage(URL(string: data.opponentPet.photos[0]))
                .resizable()
                .frame(width: 90, height: 90)
                .clipShape(.circle)
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                Text("\(data.userName) | \(data.opponentPet.petName)")
                    .font(.notoSansMedium(size: 16))
                    .padding(.bottom, 1)
                    .foregroundStyle(.mainText)
                Text("\(data.lastMessage?.content ?? "대화를 시작해보세요")")
                    .font(.notoSansMedium(size: 12))
                    .foregroundStyle(.subText)
            }
            Spacer()
            VStack(alignment: .trailing) {
                let date = DateFormatterManager.formattedTime(from: data.lastMessage?.sendMSGAt ?? "") ?? "시간정보없음"
                Text(date)
                    .font(.notoSansMedium(size: 12))
                    .foregroundStyle(.subText)
                    .padding(.bottom, 20)
//                let count = chat.filter{!$0.isRead && $0.senderPetId != MyData().myInfo?.id}.count
//                if count > 0 {
//                    Text("\(count)")
//                        .font(.notoSansMedium(size: 12))
//                        .foregroundStyle(.subText)
//                        .padding(.horizontal, 5)
//                        .background(.sandBeige)
//                        .clipShape(RoundedRectangle(cornerRadius: 5))
//                }
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
