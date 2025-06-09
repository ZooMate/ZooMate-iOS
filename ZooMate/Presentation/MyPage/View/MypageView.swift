//
//  MypageView.swift
//  ZooMate
//
//  Created by 최준영 on 5/25/25.
//

import SwiftUI
import Kingfisher

struct MyPageView: View {
    @ObservedObject var myData: MyData
    @State var stack = NavigationPath()
    @State private var showAlret = false
    @State var myPetList: [PetList] = []
    let isLoggedIn: Bool
    
    var body: some View {
        NavigationStack(path: $stack) {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(spacing: 16) {
                        ZStack {
                            if isLoggedIn {
                                if let profile = myData.myInfo?.profile, !profile.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                    KFImage(URL(string: profile))
                                        .placeholder {
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle())
                                                .frame(width: 100, height: 100)
                                        }
                                        .resizable()
                                        .background(.white)
                                        .overlay(
                                            Circle()
                                                .stroke(.sandBeige, lineWidth: 10)
                                        )
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                } else {
                                    ProfileImageView()
                                }
                            } else {
                                ProfileImageView()
                            }
                        }
                        
                        if isLoggedIn {
                            NavigationLink(value: "profileDetail") {
                                VStack(alignment: .leading) {
                                    Text(myData.myInfo?.userName ?? "이름정보없음")
                                        .font(.notoSansBold(size: 24))
                                        .foregroundStyle(.mainText)
                                        .onAppear {
                                            PetNetwork.fetchMyPetList { result in
                                                switch result {
                                                case .success(let data):
                                                    myPetList = data
                                                case .failure(let err):
                                                    print(err)
                                                }
                                            }
                                        }
                                    
                                    Text(myData.myInfo?.region ?? "지역정보없음")
                                        .font(.notoSansRegular(size: 14))
                                        .foregroundStyle(.mainText)
                                }
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(PlainButtonStyle())
                            .navigationDestination(for: String.self) { value in
                                if value == "profileDetail" {
                                    ProfileDetailView(stack: $stack, myData: myData)
                                }
                            }
                        } else {
                            NavigationLink(destination: LoginView(myData: myData)) {
                                VStack(alignment: .leading) {
                                    Text("유저")
                                        .font(.notoSansBold(size: 24))
                                        .foregroundStyle(.mainText)
                                    
                                    Text("로그인해주세요 :)")
                                        .font(.notoSansRegular(size: 14))
                                        .foregroundStyle(.mainText)
                                }
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                    
                    ZStack {
                        HStack(spacing: 16) {
                            NavigationLink(destination: MyPetListView(myData: myData, myPetList: $myPetList)) {
                                FeatureButton(title: "내 반려동물", systemImage: "pawprint")
                            }
                            NavigationLink(destination: MateListView(myData: myData)) {
                                FeatureButton(title: "메이트", systemImage: "heart")
                            }
                        }
                        .padding(.vertical, 30)
                    }
                    .background(.sandBeige)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal)
                    .padding(.vertical, 35)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("설정")
                            .font(.notoSansBold(size: 20))
                            .foregroundStyle(.mainText)
                            .padding(.leading, 16)
                        
                        ZStack() {
                            VStack(spacing: 28) {
                                Button {
                                    AuthNetwork.logout(myData: myData)
                                } label: {
                                    SettingRow(title: "로그아웃")
                                }
                                NavigationLink(destination: NoticeView()) {
                                    SettingRow(title: "공지사항")
                                }
                                Button {
                                    showAlret = true
                                } label: {
                                    SettingRow(title: "개선문의")
                                }
                                NavigationLink(destination: LegalView()) {
                                    SettingRow(title: "약관 및 정책")
                                }
                            }
                            .padding(.vertical, 35)
                        }
                        .background(.sandBeige)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
            }
            .background(Color.background.ignoresSafeArea())
            .navigationTitle("마이페이지")
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert("문의사항", isPresented: $showAlret) {
            Button("확인", role: .cancel) {}
        } message: {
            Text("nadana0929@gmail.com으로 문의주세요")
        }
    }
}

struct FeatureButton: View {
    
    let title: String
    let systemImage: String
    
    var body: some View {
        
        VStack {
            Image(systemName: systemImage)
                .font(.title)
                .foregroundColor(.category)
                .padding(.bottom, 10)
            Text(title)
                .font(.notoSansRegular(size: 14))
                .foregroundColor(.mainText)
        }
        .frame(maxWidth: .infinity)
    }
}

struct SettingRow: View {
    
    let title: String
    
    var body: some View {
        
        HStack() {
            Text(title)
                .font(.notoSansRegular(size: 16))
                .foregroundColor(.mainText)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
