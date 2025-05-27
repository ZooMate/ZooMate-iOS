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
            Text(time)
                .font(.notoSansRegular(size: 10))
                .foregroundStyle(.subText)
            Spacer()
        }
        .padding(.bottom, 14)
    }
}

#Preview {
    ReceiveMessageCell(text: "안녕하세요", time: "오후 7:58")
}
