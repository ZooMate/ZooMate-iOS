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
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(filteredPets) { pet in
                    PetCardCell(pet: pet)
                }
            }
            .padding(16)
        }
    }
    
    private var filteredPets: [Pet] {
        if filteredCategories.isEmpty {
            return viewModel.dummyPets
        } else {
            return viewModel.dummyPets.filter { filteredCategories.contains($0.category.rawValue) }
        }
    }
}
