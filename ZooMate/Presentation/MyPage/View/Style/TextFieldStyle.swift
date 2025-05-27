//
//  TextFieldStyle.swift
//  ZooMate
//
//  Created by 최준영 on 5/23/25.
//

import SwiftUI

struct TextFieldStyle: ViewModifier {
    
    var paddingSpace: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(20) // TextField 내부 placeholder padding
            .font(.notoSansMedium(size: 16))
            .foregroundStyle(.mainText)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.category, lineWidth: 2)
            )
            .padding(.horizontal, paddingSpace) // TextField <-> View 간의 padding
            .padding(.bottom, 8)
    }
}

extension View {
    func textFieldStyle(paddingSpace: CGFloat = 16) -> some View {
        self.modifier(TextFieldStyle(paddingSpace: paddingSpace))
    }
}
