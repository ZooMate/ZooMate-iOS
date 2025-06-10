//
//  Mate.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct MateView: View {
    @ObservedObject var myData: MyData
    @Binding var matePetList: [PetList]
    @State private var selectedPet: PetDetail? = nil
    @State private var isNavigating: Bool = false
    
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
                    ForEach(matePetList, id: \.id) { pet in
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
                        } label: {
                            PetCardCell(pet: pet)
                        }
                    }
                }
                .padding(16)
                .navigationTitle("메이트")
                .navigationBarTitleDisplayMode(.inline)
            }
            .navigationDestination(isPresented: $isNavigating) {
                if let selectedPet {
                    PetDetailView(pet: selectedPet, myData: myData)
                } else {
                    Text("상세 정보가 없습니다.")
                }
            }
        }
    }
}
