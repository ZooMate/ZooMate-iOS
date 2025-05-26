//
//  ProfileDetailView.swift
//  ZooMate
//
//  Created by 최준영 on 5/25/25.
//

import SwiftUI

struct ProfileDetailView: View {
    
    private let user = users[0]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    ZStack(alignment: .top) {
                        profileBackground
                        VStack(spacing: 18) {
                            Spacer().frame(height: 50)
                            profileHeader
                            petListSection
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 50)
                        
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
                        
                    }
                    .padding(.top)
                }
                .background(Color.background.ignoresSafeArea())
                .navigationTitle("내 프로필")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    // MARK: - Components
    
    private var profileBackground: some View {
        Color.sandBeige
            .frame(minHeight: UIScreen.main.bounds.height * 0.75)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
            .padding(.horizontal, 16)
            .padding(.top, 50)
    }
    
    private var profileHeader: some View {
        Group {
            VStack(alignment: .center, spacing: 18) {
                Text(user.userName)
                    .font(.notoSansBold(size: 20))
                
                Text(user.desc ?? "소개글을 등록하여 나를 표현해보세요")
                    .font(.notoSansRegular(size: 14))
                
                Button {
                    // 편집 동작
                } label: {
                    Text("프로필 편집")
                        .font(.notoSansMedium(size: 20))
                        .frame(maxWidth: .infinity)
                        .textFieldStyle()
                }
                .padding(.vertical, 24)
            }
            .foregroundStyle(.mainText)
        }
    }
    
    private var petListSection: some View {
        VStack(alignment: .leading) {
            Text("\(user.userName)님의 반려동물")
                .font(.notoSansBold(size: 16))
            
            ForEach(pets, id: \.petId) { pet in
                HStack(spacing: 12) {
                    //                    Image(systemName: "pawprint.circle.fill")
                    //                        .resizable()
                    //                        .scaledToFit()
                    //                        .frame(width: 50, height: 50)
                    //                        .foregroundColor(.pointPink)
                    
                    if let photo = pet.photos.first {
                        AsyncImage(url: URL(string: photo)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(pet.petName)
                                .font(.notoSansMedium(size: 16))
                            Text("\(pet.age)살")
                                .font(.notoSansRegular(size: 16))
                        }
                        Text(pet.category.rawValue)
                            .font(.notoSansRegular(size: 12))
                    }
                }
                .padding(.vertical)
            }
        }
        .foregroundStyle(.mainText)
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.background)
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
        .padding(.bottom, 50)
    }
}

#Preview {
    ProfileDetailView()
}
