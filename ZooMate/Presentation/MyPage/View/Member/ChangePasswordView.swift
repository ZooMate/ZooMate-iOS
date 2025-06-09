//
//  ChangePasswordView.swift
//  ZooMate
//
//  Created by Song Kim on 6/9/25.
//

import SwiftUI

struct ChangePasswordView: View {
    @ObservedObject var myData: MyData
    @State var currentPassword: String = ""
    @State var newPassword: String = ""
    @State var newPassword2: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("기존 비밀번호")
                            .padding(.horizontal, 17)
                            .font(.notoSansRegular(size: 16))
                            .foregroundStyle(.mainText)
                        TextField("기존 비밀번호 입력", text: $currentPassword)
                            .textFieldStyle()
                    }
                    .padding(.bottom, 10)
                    
                    VStack(alignment: .leading) {
                        Text("새 비밀번호")
                            .padding(.horizontal, 17)
                            .font(.notoSansRegular(size: 16))
                            .foregroundStyle(.mainText)
                        SecureField("새 비밀번호 입력", text: $newPassword)
                            .textFieldStyle()
                            .padding(.bottom, 5)
                        SecureField("새 비밀번호 재입력", text: $newPassword2)
                            .textFieldStyle()
                        
                        Text("영문 대·소문자, 숫자, 특수기호를 모두 포함한 6자 이상 30자 이하의 비밀번호를 입력해주세요.")
                            .font(.notoSansMedium(size: 12))
                            .foregroundStyle(.subText)
                            .padding(.horizontal, 17)
                    }
                    .padding(.bottom, 35)
                    
                    VStack {
                        if newPassword == newPassword2 && isValidPassword(newPassword) {
                            Button {
                                dismiss()
                            } label: {
                                Text("비밀번호 변경")
                            }
                            .pinkButtonStyle()
                        } else {
                            Text("비밀번호 변경")
                                .grayButtonStyle()
                        }
                    }
                }
            }
        }
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*(),.?\":{}|<>]).{6,30}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
}
