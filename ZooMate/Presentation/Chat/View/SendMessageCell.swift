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
    
    var body: some View {
        HStack(alignment: .bottom) {
            Spacer()
            Text(time)
                .font(.notoSansRegular(size: 10))
                .foregroundStyle(.subText)
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

#Preview {
    SendMessageCell(text: "하이하이하이ㅏ", time: "00:00")
}
