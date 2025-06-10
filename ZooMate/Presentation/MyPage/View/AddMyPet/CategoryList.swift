//
//  CategoryList.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct CategoryList: View {
    @ObservedObject var myPetData: MyPetData
    @Binding var showCategory: Bool
    @State var isModal = false
    @State var selectedImages: [UIImage] = []
    @State var addPet: AddPetRequest = AddPetRequest(petName: "", age: 0, gender: "", isNeutering: false, isPublic: false, category: "", breed: "", weight: 0, petDesc: "", tag: [], photos: [])
    @Binding var petList: [PetList]
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        showCategory = false
                    }
                }
            
            VStack(spacing: 15) {
                ForEach([Category.bird, .reptile, .cat, .dog], id: \.self) { category in
                    Button {
                        isModal = true
                        addPet.category = category.rawValue
                    } label: {
                        Text(category.displayName)
                            .font(.notoSansMedium(size: 18))
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(15)
            .padding(.horizontal, 60)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .foregroundStyle(.mainText)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(35)
            .padding(.bottom, 30)
            .padding(.horizontal, 30)
        }
        .fullScreenCover(isPresented: $isModal) {
            MyPetAddPickerView(
                myPetData: myPetData, isModal: $showCategory, addPet: $addPet, petList: $petList
            )
        }
    }
}
