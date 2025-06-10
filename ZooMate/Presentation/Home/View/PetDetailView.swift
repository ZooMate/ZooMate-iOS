//
//  PetDetailView.swift
//  ZooMate
//
//  Created by Song Kim on 5/26/25.
//

import SwiftUI
import Kingfisher

struct PetDetailView: View {
    @Binding var petList: [PetList]
    let pet: PetDetail
    let petId: Int
    let myData: MyData
    @State private var selectedPhotoIndex: Int = 0
    @State private var loginAlert: Bool = false
    @State private var isFavorite: Bool = false
    @State private var isPublic: Bool = true
    @State private var originalIsPublic: Bool = true
    @State private var isChangingPublic = false
    @Environment(\.dismiss) var dismiss
    
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
                                .onAppear {
                                    isPublic = pet.isPublic
                                    originalIsPublic = pet.isPublic
                                }
                            Spacer()
                            
                            if let _ = myData.myInfo {
                                if isMyPet {
                                    Text("프로필 공개")
                                        .font(.notoSansRegular(size: 14))
                                    Toggle("", isOn: $isPublic)
                                        .labelsHidden()
                                        .tint(.pointPink)
                                        .onChange(of: isPublic) {
                                            guard isPublic != originalIsPublic else { return } // 값이 바뀐 경우에만 실행
                                            guard !isChangingPublic else { return }
                                            
                                            isChangingPublic = true
                                            PetNetwork.updateMyPetPublic(petId: petId) { result in
                                                DispatchQueue.main.async {
                                                    switch result {
                                                    case .success(let updatedValue):
                                                        originalIsPublic = updatedValue
                                                        isPublic = updatedValue
                                                    case .failure(let err):
                                                        isPublic = originalIsPublic // 되돌리기
                                                        print("❌ 공개 여부 변경 실패:", err)
                                                    }
                                                    isChangingPublic = false
                                                }
                                            }
                                        }
                                } else {
                                    Button {
                                        isFavorite.toggle()
                                    } label: {
                                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                                            .font(.system(size: 20))
                                            .foregroundStyle(.pointPink)
                                    }
                                    .padding(.top, 5)
                                }
                            } else {
                                Button {
                                    loginAlert = true
                                } label: {
                                    Image(systemName: "heart")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.gray)
                                }
                                .padding(.top, 5)
                            }
                        }
                        
                        Text(pet.petDesc)
                            .font(.notoSansRegular(size: 16))
                            .padding(.vertical, 15)
                        
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
                    
                    if let _ = myData.myInfo, !isMyPet {
                        Button {
                            // TODO: 채팅 기능
                        } label: {
                            Text("채팅")
                                .pinkButtonStyle()
                        }
                    } else if myData.myInfo == nil {
                        Button {
                            loginAlert = true
                        } label: {
                            Text("채팅")
                                .pinkButtonStyle()
                        }
                    }
                }
                .toolbar(.hidden, for: .tabBar)
                .toolbar {
                    if isMyPet {
                        ToolbarItem(placement: .topBarTrailing) {
                            Menu {
                                Button {
                                    PetNetwork.deleteMyPet(petId: petId) { result in
                                        switch result {
                                        case .success(let msg):
                                            print(msg)
                                            PetNetwork.fetchMyPetList { fetchResult in
                                                switch fetchResult {
                                                case .success(let newList):
                                                    petList = newList
                                                case .failure(let error):
                                                    print("❌ 리스트 재불러오기 실패: \(error)")
                                                }
                                            }
                                            dismiss()
                                        case .failure(let err):
                                            print(err)
                                        }
                                    }
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
        }
        .loginRequiredAlert(isPresented: $loginAlert)
    }
}
