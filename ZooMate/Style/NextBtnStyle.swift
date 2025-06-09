//
//  NextBtnStyle.swift
//  ZooMate
//
//  Created by 최준영 on 5/27/25.
//

import SwiftUI

struct GrayButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, minHeight: 50)
            // GeometryReader 쓰면 정렬 무너짐
            // 부모 컨테이너의 최대 넓이로 width 설정
            .font(.notoSansBold(size: 16))
            .foregroundStyle(.mainText)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 10)
    }
}

extension View {
    func grayButtonStyle() -> some View {
        self.modifier(GrayButtonStyle())
    }
}
