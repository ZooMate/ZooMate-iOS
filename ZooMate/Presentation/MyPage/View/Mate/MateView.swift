//
//  Mate.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct MateView: View {
    @StateObject var data = DummyData1()
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
//            ScrollView {
//                LazyVGrid(columns: columns, spacing: 16) {
//                    ForEach(matedPets, id: \.id) { pet in
//                        if let owner = data.dummyUsers.first(where: { $0.id == pet.ownerId }) {
//                            NavigationLink(destination: PetDetailView(pet: pet)) {
//                                PetCardCell(pet: pet, user: owner)
//                            }
//                        }
//                    }
//                }
//                .padding(16)
//                .navigationTitle("메이트")
//                .navigationBarTitleDisplayMode(.inline)
//            }
        }
    }
    
    private var matedPets: [Pet] {
        let myMatePetIds = data.dummyMates
            .filter { $0.userrId == MyData().myInfo?.id }
            .map { $0.petId }

        return data.dummyPets.filter { myMatePetIds.contains($0.id) }
    }
}
