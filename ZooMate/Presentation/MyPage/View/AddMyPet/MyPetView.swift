//
//  MyPetView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct MyPetView: View {
    
    @Binding var isOnDetail: Bool
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    // MARK: 등록한 반려동물의 상세 프로필 entry에 따른 버튼 출력 여부
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(pets, id: \.id) { pet in
                    let user = users.first { $0.id == pet.ownerId }

                    NavigationLink(
                        destination: MyPetDetailView(pet: pet)
                            .onAppear { isOnDetail = true }
                            .onDisappear { isOnDetail = false }
                    ) {
                        if let user = user {
                            PetCardCell(pet: pet, user: user)
                        }
                    }
                }
            }
            .padding(16)
            .navigationTitle("내 반려동물")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
