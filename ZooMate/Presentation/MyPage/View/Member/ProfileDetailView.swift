//
//  ProfileDetailView.swift
//  ZooMate
//
//  Created by 최준영 on 5/25/25.
//

import SwiftUI
import Kingfisher

struct ProfileDetailView: View {
    @Binding var stack: NavigationPath
    @StateObject var data = DummyData1()
    
    var body: some View {
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
                    
                    let user = data.dummyUsers.first(where: { $0.id == MyData.shared.myInfo?.id })!
                    if let profile = user.profile, !profile.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        
                        KFImage(URL(string: profile))
                            .placeholder {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .frame(width: 100, height: 100)
                            }
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                    else {
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
    
    private var profileBackground: some View {
        Color.sandBeige
            .frame(minHeight: UIScreen.main.bounds.height * 0.75)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
            .padding(.horizontal, 16)
            .padding(.top, 50)
    }
    
    private var profileHeader: some View {
        let user = data.dummyUsers.first(where: { $0.id == MyData.shared.myInfo?.id })!
        
        return Group {
            VStack(alignment: .center, spacing: 18) {
                Text(user.userName)
                    .font(.notoSansBold(size: 20))
                Text(user.desc ?? "소개글을 등록하여 나를 표현해보세요")
                    .font(.notoSansRegular(size: 14))
                
                NavigationLink(destination: ProfileEditView(stack: $stack)) {
                    Text("프로필 편집")
                        .font(.notoSansMedium(size: 16))
                        .frame(maxWidth: .infinity)
                        .textFieldStyle()
                }
                .padding(.vertical, 24)
                .buttonStyle(PlainButtonStyle())
                
                
            }
            .foregroundStyle(.mainText)
        }
    }
    
    private var petListSection: some View {
        let user = data.dummyUsers.first(where: { $0.id == MyData.shared.myInfo?.id })!
        let myPets = data.dummyPets.filter { $0.ownerId == MyData.shared.myInfo?.id }
        
        return VStack(alignment: .leading) {
            Text("\(user.userName)님의 반려동물")
                .font(.notoSansBold(size: 16))
            
            ForEach(myPets, id: \.id) { pet in
                HStack(spacing: 12) {
                    
                    if let photo = pet.photos.first {
                        
                        KFImage(URL(string: photo))
                            .placeholder {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .frame(width: 70, height: 70)
                            }
                            .resizable()
                            .aspectRatio(contentMode: .fill)
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

//#Preview {
//    ProfileDetailView(firstNaviLinkActive: true)
//}
