//
//  FormLabelStyle.swift
//  ZooMate
//
//  Created by Song Kim on 6/9/25.
//

import SwiftUI

struct FormLabelStyle: ViewModifier {
    var width: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(width: width, alignment: .leading)
            .font(.notoSansMedium(size: 17))
            .foregroundStyle(.mainText)
    }
}

extension View {
    func formLabelStyle(width: CGFloat) -> some View {
        self.modifier(FormLabelStyle(width: width))
    }
}
