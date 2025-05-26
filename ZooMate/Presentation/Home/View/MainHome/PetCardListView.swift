//
//  PetCardListView.swift
//  ZooMate
//
//  Created by Song Kim on 5/23/25.
//

import SwiftUI

struct PetCardListView: View {
    @StateObject var viewModel = MainHomeController()
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
                    NavigationLink(destination: PetDetailView()) {
                        PetCardCell(pet: pet)
                    }
                }
            }
            .padding(16)
        }
    }
    
    private var filteredPets: [Pet] {
        viewModel.dummyPets.filter { pet in
            let matchesCategory = filteredCategories.isEmpty || filteredCategories.contains(pet.category.rawValue)
            let matchesRegion = selectedRegion == "전체지역" || selectedRegion == nil || viewModel.dummyUsers.first(where: { $0.userId == pet.ownerId })?.region == selectedRegion
            
            return matchesCategory && matchesRegion
        }
    }
}
