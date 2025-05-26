//
//  InputBtnStyle.swift
//  ZooMate
//
//  Created by 최준영 on 5/23/25.
//

import SwiftUI

struct InputBtnStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, minHeight: 60)
            // GeometryReader 쓰면 정렬 무너짐
            // 부모 컨테이너의 최대 넓이로 width 설정
            .font(.notoSansBold(size: 20))
            .foregroundStyle(.mainText)
            .background(.pointPink)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 16)
    }
}

extension View {
    func inputButtonStyle() -> some View {
        self.modifier(InputBtnStyle())
    }
}
