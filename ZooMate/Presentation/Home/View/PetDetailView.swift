//
//  PetDetailView.swift
//  ZooMate
//
//  Created by Song Kim on 5/26/25.
//

import SwiftUI
import Kingfisher

struct PetDetailView: View {
    let pet: PetDetail
    let myData: MyData
    @State private var selectedPhotoIndex: Int = 0
    @State private var isFavorite: Bool = false
    @State private var isPublic: Bool = true

    var isMyPet: Bool {
        myData.myInfo?.id == pet.ownerId
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.background.ignoresSafeArea()

            VStack {
                ScrollView {
                    // 사진 탭 뷰
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
                            Image(pet.gender == "male" ? "iconMale" : "iconFemale")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.bottom, -5)
                            Spacer()

                            if isMyPet {
                                Text("프로필 공개")
                                    .font(.notoSansRegular(size: 14))
                                Toggle("", isOn: $isPublic)
                                    .labelsHidden()
                                    .tint(.pointPink)
                            } else {
                                Button {
                                    isFavorite.toggle()
                                } label: {
                                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                                        .foregroundStyle(.pointPink)
                                        .font(.system(size: 30))
                                }
                            }
                        }
                        .padding(.bottom, 10)

                        Text(pet.petDesc)
                            .font(.notoSansRegular(size: 16))
                            .padding(.bottom, 15)

                        Text("프로필")
                            .font(.notoSansBold(size: 20))
                            .padding(.bottom, 5)

                        HStack {
                            Text("\(Category(rawValue: pet.category)?.displayName ?? pet.category)")
                                .frame(width: 100, alignment: .leading)
                            Text("중성화 \(pet.isNeutering ? "O" : "X")")
                        }
                        .font(.notoSansRegular(size: 15))
                        .padding(.bottom, 2)

                        HStack {
                            Text(pet.breed)
                                .frame(width: 100, alignment: .leading)
                            Text(String(format: "%.1fkg", pet.weight))
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

                if !isMyPet {
                    Button {
                        // 채팅 액션
                    } label: {
                        Text("채팅")
                            .pinkButtonStyle()
                    }
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button {
                        // TODO: 삭제 기능
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
