//
//  PetCardListView.swift
//  ZooMate
//
//  Created by Song Kim on 5/23/25.
//

import SwiftUI

struct PetCardListView: View {
    @ObservedObject var myData: MyData
    @ObservedObject var myPetData: MyPetData
    @Binding var chatRooms: [ChatRoomResponse]
    @Binding var allPetList: [PetList]
    var filteredCategories: Set<Category>
    var selectedRegion: String?
    @State private var selectedPet: PetDetail? = nil
    @State private var isNavigating: Bool = false
    @State private var isFavorite: Bool = false
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    var body: some View {
        if filteredPets.isEmpty {
            VStack {
                Spacer()
                Text("공개된 펫 정보가 없습니다")
                    .font(.notoSansRegular(size: 16))
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(filteredPets, id: \.id) { pet in
                        Button {
                            PetNetwork.fetchPetDetailData(petId: pet.id) { result in
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
            .navigationDestination(isPresented: $isNavigating) {
                if let selectedPet {
                    PetDetailView(myPetData: myPetData, petList: $allPetList, chatRooms: $chatRooms, pet: selectedPet, myData: myData, isFavorite: $isFavorite)
                } else {
                    Text("상세 정보가 없습니다.")
                }
            }
        }
    }
    
    private var filteredPets: [PetList] {
        allPetList.filter { pet in
            let matchesCategory = filteredCategories.isEmpty || filteredCategories.contains(Category(rawValue: pet.category) ?? .dog)
            let matchesRegion = selectedRegion == "전체지역" || selectedRegion == nil || pet.owner.region == selectedRegion

            return matchesCategory && matchesRegion
        }
    }
}
