//
//  Untitled.swift
//  ZooMate
//
//  Created by Song Kim on 5/23/25.
//

import SwiftUI

struct LoginView: View {
    @State var userId: String = ""
    @State var password: String = ""
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack {
                    VStack(alignment: .leading) {
                        Text("아이디")
                            .padding(.horizontal, 30)
                            .font(.notoSansRegular(size: 16))
                            .foregroundStyle(.mainText)
                        TextField("아이디 입력", text: $userId)
                            .textFieldStyle()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("비밀번호")
                            .padding(.horizontal, 30)
                            .font(.notoSansRegular(size: 16))
                            .foregroundStyle(.mainText)
                        SecureField("비밀번호 입력", text: $password)
                            .textFieldStyle()
                    }
                    .padding(.bottom, 35)
                    
                    VStack {
                        Button {
                            
                        } label: {
                            Text("로그인")
                        }
                        .inputButtonStyle()
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                           
                        } label: {
                            Text("회원가입")
                                .font((.notoSansMedium(size: 12)))
                                .foregroundStyle(.mainText)
                                .padding(20)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
