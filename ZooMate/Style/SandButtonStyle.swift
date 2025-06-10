//
//  SandButtonStyle.swift
//  ZooMate
//
//  Created by Song Kim on 6/9/25.
//

import SwiftUI

struct SandButtonStyle: ViewModifier {
    var isSelected: Bool
    var width: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(width: width)
            .font(.notoSansRegular(size: 17))
            .foregroundStyle(.category)
            .background(isSelected ? Color.sandBeige : Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.sandBeige, lineWidth: 2)
            }
    }
}

extension View {
    func sandButtonStyle(isSelected: Bool, width: CGFloat) -> some View {
        self.modifier(SandButtonStyle(isSelected: isSelected, width: width))
    }
}
