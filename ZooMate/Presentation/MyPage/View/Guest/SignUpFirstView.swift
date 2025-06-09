//
//  SignUpFirstView.swift
//  ZooMate
//
//  Created by 최준영 on 5/23/25.
//

import SwiftUI

struct SignUpFirstView: View {
    @Binding var showSingUp: Bool
    @State var userId: String = ""
    @State var password: String = ""
    @State var password2: String = ""
    @State var checkId: Bool = false
    @State var user: UserResponse = UserResponse(id: 0, userId: "", userName: "", region: "", userDesc: "", profile: "")
    
    @State private var selectedImage: UIImage?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.background.ignoresSafeArea()
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
                
                VStack {
                    ZStack(alignment: .top) {
                        ZStack {
                            Color.sandBeige
                                .onTapGesture {
                                    UIApplication.shared.endEditing()
                                }
                            
                            VStack {
                                Group {
                                    VStack(alignment: .leading) {
                                        Text("아이디*")
                                            .padding(.horizontal, 30)
                                            .font(.notoSansRegular(size: 16))
                                            .foregroundStyle(.mainText)
                                        HStack {
                                            TextField("아이디 입력", text: $userId)
                                                .textFieldStyle(paddingSpace: 24)
                                                .textInputAutocapitalization(.never)
                                                .autocorrectionDisabled(true)
                                                .padding(.trailing, -20)
                                                .overlay(
                                                    HStack {
                                                        Spacer()
                                                        Image(systemName: checkId ? "checkmark" : "xmark")
                                                            .foregroundColor(checkId ? .green : .red)
                                                            .padding(.trailing, 20)
                                                            .padding(.bottom, 8)
                                                    }
                                                )
                                                .onChange(of: userId) {
                                                    checkId = false
                                                }
                                            Button {
                                                AuthNetwork.checkId(userId: userId) { result in
                                                    switch result {
                                                    case .success(let check):
                                                        checkId = !check
                                                    case .failure(_ ):
                                                        print("")
                                                    }
                                                }
                                            } label : {
                                                Text("중복검사")
                                                    .foregroundStyle(Color.background)
                                            }
                                            .padding()
                                            .padding(.vertical, 2)
                                            .background(.category)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .buttonStyle(.plain)
                                            .padding(.bottom, 8)
                                            .padding(.trailing, 10)
                                        }
                                    }
                                    .padding(.top, 50)
                                    
                                    VStack(alignment: .leading) {
                                        Text("비밀번호*")
                                            .padding(.horizontal, 30)
                                            .font(.notoSansRegular(size: 16))
                                            .foregroundStyle(.mainText)
                                        SecureField("비밀번호 입력", text: $password)
                                            .textFieldStyle(paddingSpace: 24)
                                            .textInputAutocapitalization(.never)
                                            .autocorrectionDisabled(true)
                                        
                                        SecureField("비밀번호 재입력", text: $password2)
                                            .textFieldStyle(paddingSpace: 24)
                                            .textInputAutocapitalization(.never)
                                            .autocorrectionDisabled(true)
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
                        .padding(.horizontal, 16)
                        .padding(.top, 50)
                        // FIXME: 회원 여부에 따른 이미지 가져오기, 기본 이미지 출력
                        ProfileImageSelectedView(myData: MyData(), selectedImage: $selectedImage, isNewUser: true)
                    }
                    .padding(.top)
                    
                    VStack {
                        if (password == password2) && checkId && !password.isEmpty{
                            NavigationLink(destination: SignUpSecondView(showSingUp: $showSingUp)) {
                                Text("다음")
                                    .inputButtonStyle()
                            }
                        } else {
                            Text("다음")
                                .nextBtnStyle()
                        }
                    }
                    .padding(.top)
                }
            }
            .ignoresSafeArea(.keyboard)
            .navigationTitle("회원가입")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showSingUp = false
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.mainText)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}
