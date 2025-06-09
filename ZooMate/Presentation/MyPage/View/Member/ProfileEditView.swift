//
//  ProfileEditView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct ProfileEditView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var stack: NavigationPath
    @ObservedObject var myData: MyData
    @State var showRegionSheet = false
    @State var userRegion: String = ""
    @State var userName: String = ""
    @State var userDesc: String = ""
    @State private var selectedImage: UIImage?
    
    init(stack: Binding<NavigationPath>, myData: MyData) {
        self._stack = stack
        self.myData = myData
    }
    
    var body: some View {
        let user = myData.myInfo
        
        ZStack(alignment: .top) {
            ScrollView {
                ZStack(alignment: .top) {
                    VStack(spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("아이디")
                                .padding(.horizontal, 30)
                                .font(.notoSansRegular(size: 16))
                                .foregroundStyle(.mainText)
                            Text(user?.userId ?? "")
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
                        
                        EdittingRow(title: "소개글", text: $userDesc, isMultiline: true)
                            .padding(.bottom, -4)
                        
                        Spacer()
                        
                        HStack(spacing: 10) {
                            Button {
                                AuthNetwork.deleteUser { result in
                                    switch result {
                                    case .success(let success):
                                        if success {
                                            stack = .init()
                                            KeychainHelper.delete(forAccount: "token")
                                            myData.clear()
                                        }
                                    case .failure(_ ):
                                        print("")
                                    }
                                }
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
                    
                    ProfileImageSelectedView(myData: myData, selectedImage: $selectedImage)
                }
                .padding(.top)
                
                VStack {
                    Button {
                        dismiss()
                        let updatedUser = MyInfoData(
                            id: user?.id ?? 0,
                            userId: user?.userId ?? "",
                            userName: userName,
                            region: userRegion,
                            userDesc: userDesc,
                            profile: user?.profile ?? ""
                        )

                        UserNetwork.updateUserInfo(user: updatedUser) { result in
                            switch result {
                            case .success(_):
                                myData.myInfo = updatedUser
                                myData.save()
                            case .failure(let error):
                                print("❌ 업데이트 실패: \(error.localizedDescription)")
                            }
                        }
                    } label: {
                        Text("작성 완료")
                    }
                    .inputButtonStyle()
                    .padding(.top)
                }
            }
            .onAppear {
                userName = user?.userName ?? "이름정보없음"
                userRegion = user?.region ?? "지역정보없음"
                userDesc = user?.userDesc ?? ""
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
