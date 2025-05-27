//
//  SendMessageCell.swift
//  ZooMate
//
//  Created by Song Kim on 5/27/25.
//

import SwiftUI

struct SendMessageCell: View {
    let text: String
    let time: String
    let isRead: Bool
    
    var body: some View {
        HStack(alignment: .bottom) {
            Spacer()
            VStack(alignment: .trailing) {
                Text(isRead ? "" : "1")
                    .font(.notoSansRegular(size: 10))
                    .foregroundStyle(.category)
                Text(time)
                    .font(.notoSansRegular(size: 10))
                    .foregroundStyle(.subText)
            }
            Text(text)
                .font(.notoSansRegular(size: 15))
                .foregroundColor(.black)
                .padding(10)
                .padding(.horizontal, 5)
                .background(.sandBeige)
                .cornerRadius(15)
        }
        .padding(.bottom, 14)
    }
}
