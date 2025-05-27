//
//  ReceiveMessageCell.swift
//  ZooMate
//
//  Created by Song Kim on 5/27/25.
//

import SwiftUI

struct ReceiveMessageCell: View {
    let text: String
    let time: String
    let isRead: Bool
    
    var body: some View {
        HStack(alignment: .bottom){
            Text(text)
                .font(.notoSansRegular(size: 15))
                .foregroundColor(.black)
                .padding(10)
                .padding(.horizontal, 5)
                .background(.white)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.sandBeige, lineWidth: 1)
                )
            VStack(alignment: .leading) {
                Text(isRead ? "" : "1")
                    .font(.notoSansRegular(size: 10))
                    .foregroundStyle(.category)
                Text(time)
                    .font(.notoSansRegular(size: 10))
                    .foregroundStyle(.subText)
            }
            Spacer()
        }
        .padding(.bottom, 14)
    }
}
