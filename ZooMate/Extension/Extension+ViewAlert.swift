
//
//  Extension+ViewAlert.swift
//  ZooMate
//
//  Created by Song Kim on 6/10/25.
//

import SwiftUI

extension View {
    func loginRequiredAlert(isPresented: Binding<Bool>) -> some View {
        self.alert("로그인이 필요합니다", isPresented: isPresented) {
            Button("확인", role: .cancel) {}
        } message: {
            Text("해당 기능은 로그인 후 이용할 수 있어요.")
        }
    }
}
