//
//  MyPetView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct MyPetView: View {
    @Binding var isOnDetail: Bool
    @Binding var myPetList: [PetList]
    @ObservedObject var myData: MyData
    @State private var selectedPet: PetDetail? = nil
    @State private var isNavigating: Bool = false
    @State private var petId: Int = 0
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(myPetList, id: \.id) { pet in
                        Button {
                            PetNetwork.fetchMyPetDetailData(petId: pet.id) { result in
                                switch result {
                                case .success(let data):
                                    petId = pet.id
                                    selectedPet = data
                                    isNavigating = true
                                case .failure(let error):
                                    print("❌ 상세 불러오기 실패: \(error)")
                                }
                            }
                        } label: {
                            PetCardCell(pet: pet)
                        }
                    }
                }
                .padding(16)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $isNavigating) {
            if let selectedPet {
                PetDetailView(pet: selectedPet, petId: petId, myData: myData)
                    .onAppear { isOnDetail = true }
                    .onDisappear { isOnDetail = false }
            } else {
                Text("상세 정보가 없습니다.")
            }
        }
    }
}

