//
//  ProfileEditView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct ProfileEditView: View {
    @Binding var stack: NavigationPath
    @State var showRegionSheet = false
    @StateObject var data = DummyData1()
    @State var userRegion: String = ""
    @State var userName: String = ""
    @State var desc: String = ""
    @State private var selectedImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    
    init(stack: Binding<NavigationPath>) {
        self._stack = stack
    }
    
    var body: some View {
        let user = data.dummyUsers.first(where: { $0.id == MyData.myId })!
        
        ZStack(alignment: .top) {
            ScrollView {
                ZStack(alignment: .top) {
                    
                    VStack(spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("아이디")
                                .padding(.horizontal, 30)
                                .font(.notoSansRegular(size: 16))
                                .foregroundStyle(.mainText)
                            Text(user.userId)
                                .font(.notoSansMedium(size: 16))
                                .foregroundStyle(.subText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(15)
                                .padding(.horizontal, 5)
                                .background(Color.background)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.category, lineWidth: 2)
                                )
                                .padding(.horizontal, 24)
                                .padding(.bottom, 4)
                        }
                        .padding(.top, 50)
                        
                        EdittingRow(title: "닉네임", text: $userName)
                            .padding(.bottom, -4)
                        
                        VStack(alignment: .leading) {
                            Text("지역*")
                                .padding(.horizontal, 30)
                                .font(.notoSansRegular(size: 16))
                                .foregroundStyle(.mainText)
                            Button {
                                showRegionSheet = true
                            } label: {
                                Text(userRegion.isEmpty ? "지역선택" : userRegion)
                                    .font(.notoSansMedium(size: 16))
                                    .foregroundStyle(.mainText)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(15)
                                    .padding(.horizontal, 5)
                                    .background(Color.background)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.category, lineWidth: 2)
                                    )
                                    .padding(.horizontal, 24)
                                    .padding(.bottom, 4)
                            }
                            .overlay(
                                HStack {
                                    Spacer()
                                    Image(systemName:"chevron.down")
                                        .padding(.trailing, 40)
                                        .padding(.bottom, 4)
                                }
                            )
                        }
                        
                        EdittingRow(title: "소개글", text: $desc, isMultiline: true)
                            .padding(.bottom, -4)
                        
                        Spacer()
                        
                        HStack(spacing: 10) {
                            Button {
                                stack = .init()
                            } label: {
                                Text("로그아웃")
                                    .font(.notoSansRegular(size: 12))
                                    .foregroundStyle(.subText)
                            }
                            
                            Button {
                                stack = .init()
                            } label: {
                                Text("회원탈퇴")
                                    .font(.notoSansRegular(size: 12))
                                    .foregroundStyle(.subText)
                            }
                            
                            Button {
                                stack = .init()
                            } label: {
                                Text("비밀번호변경")
                                    .font(.notoSansRegular(size: 12))
                                    .foregroundStyle(.subText)
                            }
                        }
                        .padding(.vertical, 20)
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
            .onAppear {
                userName = user.userName
                userRegion = user.region!
                desc = user.desc ?? ""
            }
            .background(Color.background.ignoresSafeArea())
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            .navigationTitle("프로필 수정")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showRegionSheet) {
                AddRegionList(textMenu: $userRegion)
            }
        }
    }
}

struct EdittingRow: View {
    
    let title: String
    let text: Binding<String>
    var isMultiline: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .padding(.horizontal, 30)
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
