//
//  LoginPromptView.swift
//  ZooMate
//
//  Created by Song Kim on 6/9/25.
//

import SwiftUI

struct LoginPromptView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("유저정보 없음")
                .font(.notoSansMedium(size: 18))
                .foregroundColor(.mainText)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)  // 배경색 조정
        .ignoresSafeArea()
        .multilineTextAlignment(.center)
    }
}
