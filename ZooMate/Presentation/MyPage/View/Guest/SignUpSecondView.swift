//
//  SignUpSecondView.swift
//  ZooMate
//
//  Created by 최준영 on 5/23/25.
//

import SwiftUI

struct SignUpSecondView: View {
    @Binding var showSingUp: Bool
    @State var userName: String = ""
    @State var userRegion: String = ""
    @State var desc: String = ""
    
    @State private var selectedImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.background.ignoresSafeArea()
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            
            VStack {
                ZStack {
                    Color.sandBeige
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                        }
                    
                    VStack {
                        Group {
                            VStack(alignment: .leading) {
                                Text("닉네임*")
                                    .padding(.horizontal, 30)
                                    .font(.notoSansRegular(size: 16))
                                    .foregroundStyle(.mainText)
                                TextField("닉네임 입력", text: $userName)
                                    .textFieldStyle(paddingSpace: 24)
                            }
                            .padding(.top, 50)
                            
                            VStack(alignment: .leading) {
                                Text("지역*")
                                    .padding(.horizontal, 30)
                                    .font(.notoSansRegular(size: 16))
                                    .foregroundStyle(.mainText)
                                SecureField("지역 선택", text: $userRegion)
                                    .textFieldStyle(paddingSpace: 24)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("소개글")
                                    .padding(.horizontal, 30)
                                    .font(.notoSansRegular(size: 16))
                                    .foregroundStyle(.mainText)
                                TextField("간단하게 나를 소개해보세요", text: $desc)
                                    .textFieldStyle(paddingSpace: 24)
                            }
                        }
                        Spacer()
                    }
                }
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
                .padding(.horizontal, 16)
                .padding(.top, 50)
                
                Button {
                    showSingUp = false
                } label: {
                    Text("작성 완료")
                }
                .inputButtonStyle()
                .padding(.top)
            }
        }
        .ignoresSafeArea(.keyboard)
        .navigationTitle("회원가입")
        .navigationBarTitleDisplayMode(.inline)
    }
}
