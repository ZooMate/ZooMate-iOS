//
//  SandTextFieldStyle.swift
//  ZooMate
//
//  Created by Song Kim on 6/9/25.
//

import SwiftUI

struct SandTextFieldStyle: ViewModifier {
    var width: CGFloat
    func body(content: Content) -> some View {
        content
            .frame(width: width)
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .font(.notoSansRegular(size: 17))
            .foregroundStyle(.category)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.sandBeige, lineWidth: 2)
            }
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
    }
}

extension View {
    func sandTextFieldStyle(width: CGFloat) -> some View {
        self.modifier(SandTextFieldStyle(width: width))
    }
}
