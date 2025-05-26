//
//  MypageView.swift
//  ZooMate
//
//  Created by 최준영 on 5/25/25.
//

import SwiftUI

struct MyPageView: View {
    
    let isLoggedIn: Bool
    
    private let user = users[0]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // MARK: - 프로필 요약
                    HStack(spacing: 16) {
                        ZStack {
                            if isLoggedIn {
                                if let profile = user.profile, !profile.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                    AsyncImage(url: URL(string: profile)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                } else {
                                    ProfileImageView()
                                }
                            } else {
                                ProfileImageView()
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text(isLoggedIn ? user.userName : "유저")
                                .font(.notoSansBold(size: 24))
                                .foregroundStyle(.mainText)
                            
                            Text(isLoggedIn ? "🌱 서울시 \(user.region ?? "OO구 (불러오는 중...)")" : "로그인해주세요 :)")
                                .font(.notoSansRegular(size: 14))
                                .foregroundStyle(.mainText)
                        }
                    }
                    .padding(.horizontal)
                    
                    // MARK: - 주요 기능
                    ZStack {
                        HStack(spacing: 16) {
                            FeatureButton(title: "내 반려동물", systemImage: "pawprint")
                            FeatureButton(title: "메이트", systemImage: "heart")
                        }
                        .padding(.vertical, 30)
                    }
                    //.background(.pointPink.opacity(0.8))
                    .background(.sandBeige)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal)
                    .padding(.vertical, 35)
                    
                    // MARK: - 설정 섹션
                    
                        VStack(alignment: .leading, spacing: 12) {
                            Text("설정")
                                .font(.notoSansBold(size: 20))
                                .foregroundStyle(.mainText)
                                .padding(.leading, 16)
                                
                            ZStack() {
                                VStack(spacing: 28) {
                                    SettingRow(title: "공지사항")
                                    SettingRow(title: "알림설정")
                                    SettingRow(title: "개선문의")
                                    SettingRow(title: "약관 및 정책")
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
    MyPageView(isLoggedIn:  true)
}
