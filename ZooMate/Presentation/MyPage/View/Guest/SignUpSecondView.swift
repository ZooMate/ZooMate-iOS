//
//  SignUpSecondView.swift
//  ZooMate
//
//  Created by 최준영 on 5/23/25.
//

import SwiftUI

struct SignUpSecondView: View {
    @Binding var showSingUp: Bool
    @State var showRegionSheet = false
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
                                        .padding(.bottom, 8)
                                }
                                .overlay(
                                    HStack {
                                        Spacer()
                                        Image(systemName:"chevron.down")
                                            .padding(.trailing, 40)
                                            .padding(.bottom, 8)
                                    }
                                )
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
                
                if userName.isEmpty || userRegion.isEmpty {
                    Text("작성 완료")
                        .nextBtnStyle()
                        .padding(.top)
                } else {
                    Button {
                        showSingUp = false
                    } label: {
                        Text("작성 완료")
                            .inputButtonStyle()
                    }
                    .padding(.top)
                }
            }
        }
        .fullScreenCover(isPresented: $showRegionSheet) {
            AddRegionList(textMenu: $userRegion)
        }
        .ignoresSafeArea(.keyboard)
        .navigationTitle("회원가입")
        .navigationBarTitleDisplayMode(.inline)
    }
}
