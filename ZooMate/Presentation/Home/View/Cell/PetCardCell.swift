//
//  PetCardViewCell.swift
//  ZooMate
//
//  Created by Song Kim on 5/23/25.
//

import SwiftUI
import Kingfisher

struct PetCardCell: View {
    let pet: PetList
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 8) {
                KFImage(URL(string: pet.photos.first ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 150)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text("\(pet.petName) \(pet.age)살")
                            .font(.notoSansMedium(size: 14))
                            .foregroundStyle(.mainText)
                        Image(pet.gender == "male" ? "iconMale" : "iconFemale")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundColor(pet.gender == "male" ? .blue : .pink)
                    }
                    .padding(.top, 6)
                    
                    Text("[\(Category(rawValue: pet.category)?.displayName ?? pet.category)] \(pet.breed)")
                        .font(.notoSansRegular(size: 12))
                        .foregroundColor(.subText)
                        .padding(.top, 3)
                }
                .padding([.horizontal, .bottom], 15)
            }
            .background(.sandBeige)
            .cornerRadius(20)
            
            if let url = URL(string: pet.owner.profile) {
                KFImage(url)
                    .resizable()
                    .background(.white)
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.sandBeige, lineWidth: 4)
                    )
                    .padding(.bottom, 44)
                    .padding(.trailing, 10)
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .background(Color.pointPink)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.sandBeige, lineWidth: 4)
                    )
                    .padding(.bottom, 44)
                    .padding(.trailing, 10)
            }
        }
    }
}

