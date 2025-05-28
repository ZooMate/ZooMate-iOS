//
//  SignUpView.swift
//  ZooMate
//
//  Created by 최준영 on 5/23/25.
//

import SwiftUI

struct SignUpView: View {
    
    @State var userId: String = ""
    @State var password: String = ""
    @State var userName: String = ""
    @State var desc: String = ""
    
    @State private var selectedImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    ZStack(alignment: .top) {
                        VStack {
                            Spacer().frame(height: 50)
                            Group {
                                VStack(alignment: .leading) {
                                    Text("아이디*")
                                        .padding(.horizontal, 40)
                                        .font(.notoSansRegular(size: 16))
                                        .foregroundStyle(.mainText)
                                    TextField("아이디 입력", text: $userId)
                                        .textFieldStyle(paddingSpace: 24)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("비밀번호*")
                                        .padding(.horizontal, 40)
                                        .font(.notoSansRegular(size: 16))
                                        .foregroundStyle(.mainText)
                                    SecureField("비밀번호 입력", text: $password)
                                        .textFieldStyle(paddingSpace: 24)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("닉네임*")
                                        .padding(.horizontal, 40)
                                        .font(.notoSansRegular(size: 16))
                                        .foregroundStyle(.mainText)
                                    TextField("예시) 호도도 내리는 솔방울", text: $userName)
                                        .textFieldStyle(paddingSpace: 24)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("소개글")
                                        .padding(.horizontal, 40)
                                        .font(.notoSansRegular(size: 16))
                                        .foregroundStyle(.mainText)
                                    TextField("간단하게 나를 소개해보세요", text: $desc)
                                        .textFieldStyle(paddingSpace: 24)
                                }
                            }
                            Spacer().frame(height: 50)
                        }
                        .background(.sandBeige)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
                        .padding(.horizontal, 16)
                        .padding(.top, 50)
                        // FIXME: 회원 여부에 따른 이미지 가져오기, 기본 이미지 출력
                        ProfileImageSelectedView(selectedImage: $selectedImage, isNewUser: true)
                    }
                    .padding(.top)
                    
                    VStack {
                        Button {
                            dismiss()
                        } label: {
                            Text("작성 완료")
                        }
                        .inputButtonStyle()
                        .padding(.top)
                    }
                }
                .background(Color.background.ignoresSafeArea())
                .navigationTitle("회원가입")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    SignUpView()
}
