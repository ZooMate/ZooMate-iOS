//
//  PetDetailView.swift
//  ZooMate
//
//  Created by Song Kim on 5/26/25.
//

import SwiftUI
import Kingfisher

struct PetDetailView: View {
    let pet: Pet
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack {
                    Color.background
                        .ignoresSafeArea()
                    
                    VStack(alignment: .leading) {
                        KFImage(URL(string: pet.photos[0]))
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom, 10)
                            .padding(.horizontal, -16)
                        
                        HStack {
                            Text(pet.petName)
                                .font(.notoSansBold(size: 25))
                            Text("\(pet.age)살")
                                .font(.notoSansBold(size: 20))
                                .padding(.trailing, 3)
                            Image(pet.gender.rawValue == "male" ? "iconMale" : "iconFemail")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.bottom, -5)
                            Spacer()
                            Button {
                                //
                            } label: {
                                Image(systemName: "heart")
                                    .foregroundStyle(.pointPink)
                                    .frame(width: 25, height: 25)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        Text("""
            우리 시루는요 어쩌구 저쩌구
            집에만있지만 아무튼 외로워서
            친구를 구한다고 합니다
            """)
                        .font(.notoSansRegular(size: 16))
                        .padding(.bottom, 15)
                        
                        Text("프로필")
                            .font(.notoSansBold(size: 20))
                            .padding(.bottom, 5)
                        
                        HStack {
                            Text("\(pet.category)")
                                .frame(width: 100, alignment: .leading)
                            Text("\(pet.gender) / 중성화 \(pet.isNeutering ? "O" : "X")")
                        }
                        .font(.notoSansRegular(size: 15))
                        .padding(.bottom, 2)
                        
                        HStack {
                            Text(pet.breed ?? "")
                                .frame(width: 100, alignment: .leading)
                            Text(pet.weight != nil ? (String(format: "%.1f", pet.weight!)) + "kg" : "무게정보없음")
                        }
                        .font(.notoSansRegular(size: 15))
                        .padding(.bottom, 15)
                        
                        Text("성격")
                            .font(.notoSansBold(size: 20))
                            .padding(.bottom, 5)
                        
                        TagWrapView(tags: pet.tag)
                            .padding(.bottom, 10)
                        
                        Button {
                            
                        } label: {
                            Text("채팅")
                                .frame(width: geo.size.width - 32, height: 50)
                                .background(.pointPink)
                                .cornerRadius(15)
                                .foregroundStyle(.black)
                                .font(.notoSansMedium(size: 16))
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    MainHomeView()
}
