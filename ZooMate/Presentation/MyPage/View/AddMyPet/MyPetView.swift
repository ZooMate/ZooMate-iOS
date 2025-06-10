//
//  MyPetView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct MyPetView: View {
    @Binding var myPetList: [PetList]
    @ObservedObject var myData: MyData
    @ObservedObject var myPetData: MyPetData
    @Binding var chatRooms: [ChatRoomResponse]
    @State private var selectedPet: PetDetail? = nil
    @State private var isNavigating: Bool = false
    @State private var isFavorite: Bool = false
    
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
                                    selectedPet = data
                                    isNavigating = true
                                case .failure(let error):
                                    print("❌ 상세 불러오기 실패: \(error)")
                                }
                            }
                            MateNetwork.fetchMatePetStatus(petId: pet.id) { result in
                                switch result {
                                case .success(let data):
                                    isFavorite = data
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
                PetDetailView(myPetData: myPetData, petList: $myPetList, chatRooms: $chatRooms, pet: selectedPet, myData: myData, isFavorite: $isFavorite)
            } else {
                Text("상세 정보가 없습니다.")
            }
        }
    }
}

