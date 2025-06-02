//
//  MyPetDetailView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI
import Kingfisher

struct MyPetDetailView: View {
    
    let pet: Pet
    
    @State var isPublic: Bool = true
    @State private var selectedPhotoIndex: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    TabView(selection: $selectedPhotoIndex) {
                        ForEach(pet.photos.indices, id: \.self) { index in
                            KFImage(URL(string: pet.photos[index]))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                                .tag(index)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    .tabViewStyle(PageTabViewStyle())
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(pet.petName)
                                .font(.notoSansBold(size: 25))
                            Text("\(pet.age)살")
                                .font(.notoSansBold(size: 20))
                                .padding(.trailing, 3)
                            Image(pet.gender.rawValue == "male" ? "iconMale" : "iconFemale")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.bottom, -5)
                            Spacer()
                            
                            Text("프로필 공개")
                                .font(.notoSansRegular(size: 14))
                            Toggle("", isOn: $isPublic)
                                .labelsHidden()
                                .tint(.pointPink)
                        }
                        .padding(.bottom, 10)
                        
                        Text(pet.petDesc)
                            .font(.notoSansRegular(size: 16))
                            .padding(.bottom, 15)
                        
                        Text("프로필")
                            .font(.notoSansBold(size: 20))
                            .padding(.bottom, 5)
                        
                        HStack {
                            Text("\(pet.category)")
                                .frame(width: 100, alignment: .leading)
                            Text("중성화 \(pet.isNeutering ? "O" : "X")")
                        }
                        .font(.notoSansRegular(size: 15))
                        .padding(.bottom, 2)
                        
                        HStack {
                            Text(pet.breed ?? "")
                                .frame(width: 100, alignment: .leading)
                            Text(pet.weight != nil ? String(format: "%.1fkg", pet.weight!) : "무게정보없음")
                        }
                        .font(.notoSansRegular(size: 15))
                        .padding(.bottom, 15)
                        
                        Text("성격")
                            .font(.notoSansBold(size: 20))
                            .padding(.bottom, 5)
                        
                        TagWrapView(tags: pet.tag)
                            .padding(.bottom, 20)
                    }
                    .padding(.horizontal, 16)
                }
                
                // ✅ 하단 고정 버튼
                Button {
                    // 채팅 액션
                } label: {
                    Text("채팅")
                        .inputButtonStyle()
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button {
                        // TODO: 삭제기능
                    } label: {
                        Text("삭제")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    MyPetListView()
}
