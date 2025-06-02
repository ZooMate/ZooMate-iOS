//
//  MypageView.swift
//  ZooMate
//
//  Created by 최준영 on 5/25/25.
//

import SwiftUI
import Kingfisher

struct MyPageView: View {
    @State var stack = NavigationPath()
    let isLoggedIn: Bool
    @StateObject var data = DummyData1()
    @State private var showAlret = false
    
    var body: some View {
        let user = data.dummyUsers.first(where: { $0.id == MyData.myId })!
        NavigationStack(path: $stack) {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    HStack(spacing: 16) {
                        
                        ZStack {
                            if isLoggedIn {
                                if let profile = user.profile, !profile.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                    KFImage(URL(string: profile))
                                        .placeholder {
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle())
                                                .frame(width: 100, height: 100)
                                        }
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
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
                                    Text(isLoggedIn ? user.userName : "유저")
                                        .font(.notoSansBold(size: 24))
                                        .foregroundStyle(.mainText)
                                    
                                    Text(isLoggedIn ? "🌱 서울시 \(user.region ?? "OO구 (불러오는 중...)")" : "로그인해주세요 :)")
                                        .font(.notoSansRegular(size: 14))
                                        .foregroundStyle(.mainText)
                                }
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(PlainButtonStyle())
                            .navigationDestination(for: String.self) { value in
                                if value == "profileDetail" {
                                    ProfileDetailView(stack: $stack)
                                }
                            }
                        } else {
                            NavigationLink(destination: LoginView()) {
                                VStack(alignment: .leading) {
                                    Text(isLoggedIn ? user.userName : "유저")
                                        .font(.notoSansBold(size: 24))
                                        .foregroundStyle(.mainText)
                                    
                                    Text(isLoggedIn ? "🌱 서울시 \(user.region ?? "OO구 (불러오는 중...)")" : "로그인해주세요 :)")
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
                            NavigationLink(destination: MyPetListView()) {
                                FeatureButton(title: "내 반려동물", systemImage: "pawprint")
                            }
                            NavigationLink(destination: MateListView()) {
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
                                NavigationLink(destination: NoticeView()) {
                                    SettingRow(title: "공지사항")
                                }
                                Button {
                                    showAlret = true
                                } label: {
                                    SettingRow(title: "개선문의")
                                }
                                NavigationLink(destination: PushView()) {
                                    SettingRow(title: "알림설정")
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

#Preview {
    MyPageView(isLoggedIn: false)
}
