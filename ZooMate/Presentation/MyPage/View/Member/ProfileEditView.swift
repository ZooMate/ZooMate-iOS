//
//  ProfileEditView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct ProfileEditView: View {
    @Binding var stack: NavigationPath
    private let user = users[0]
    @State var password: String = ""
    @State var userName: String = ""
    @State var desc: String = ""
    @State private var selectedImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    
    init(stack: Binding<NavigationPath>) {
        _password = State(initialValue: user.password)
        _userName = State(initialValue: user.userName)
        _desc = State(initialValue: user.desc ?? "")
        self._stack = stack
    }
    
    var body: some View {
        //NavigationView {
        ZStack(alignment: .top) {
            ScrollView {
                ZStack(alignment: .top) {
                    
                    VStack(spacing: 24) {
                        Spacer().frame(height: 50)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("아이디")
                                .padding(.horizontal, 40)
                                .font(.notoSansRegular(size: 16))
                                .foregroundStyle(.mainText)
                            
                            Text(user.userId)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .textFieldStyle(paddingSpace: 24)
                        }
                        
                        EdittingRow(title: "비밀번호", text: $password)
                        EdittingRow(title: "닉네임", text: $userName)
                        EdittingRow(title: "소개글", text: $desc, isMultiline: true)
                        
                        HStack(spacing: 35) {
                            Button {
                                stack = .init()
                            } label: {
                                Text("로그아웃")
                                    .font(.notoSansRegular(size: 16))
                                    .foregroundStyle(.mainText)
                            }
                            
                            Button {
                                stack = .init()
                            } label: {
                                Text("회원탈퇴")
                                    .font(.notoSansRegular(size: 16))
                                    .foregroundStyle(.mainText)
                            }
                        }
                        
                        Spacer().frame(height: 50)
                    }
                    .background(.sandBeige)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 16)
                    .padding(.top, 50)
                    
                    ProfileImageSelectedView(selectedImage: $selectedImage)
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
            .navigationTitle("프로필 수정")
            .navigationBarTitleDisplayMode(.inline)
        }
        //}
    }
}

struct EdittingRow: View {
    
    let title: String
    let text: Binding<String>
    var isMultiline: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .padding(.horizontal, 40)
                .font(.notoSansRegular(size: 16))
                .foregroundStyle(.mainText)
            
            if isMultiline {
                TextEditor(text: text)
                    .frame(height: 100)
                    .textFieldStyle(paddingSpace: 24)
            }
            else {
                TextField("", text: text)
                    .textFieldStyle(paddingSpace: 24)
            }
        }
    }
}
