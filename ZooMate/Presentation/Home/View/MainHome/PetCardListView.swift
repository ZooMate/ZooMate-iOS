//
//  PetCardListView.swift
//  ZooMate
//
//  Created by Song Kim on 5/23/25.
//

import SwiftUI

struct PetCardListView: View {
    @StateObject var data = DummyData1()
    var filteredCategories: Set<String>
    var selectedRegion: String?
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(filteredPets) { pet in
                    if let owner = data.dummyUsers.first(where: { $0.id == pet.ownerId }) {
                        NavigationLink(destination: PetDetailView(pet: pet)) {
                            PetCardCell(pet: pet, user: owner)
                        }
                    }
                }
            }
            .padding(16)
        }
    }
    
    private var filteredPets: [Pet] {
        data.dummyPets.filter { pet in
            let matchesCategory = filteredCategories.isEmpty || filteredCategories.contains(pet.category.rawValue)
            let matchesRegion = selectedRegion == "전체지역" || selectedRegion == nil || data.dummyUsers.first(where: { $0.id == pet.ownerId })?.region == selectedRegion

            return matchesCategory && matchesRegion
        }
    }
}
