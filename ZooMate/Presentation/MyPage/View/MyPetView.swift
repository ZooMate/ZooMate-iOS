//
//  MyPetView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct MyPetView: View {
    //@StateObject var data = DummyData()
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(pets, id: \.petId) { pet in
                        PetCardCell(pet: pet)
                    }
                }
                .padding(16)
                .navigationTitle("내 반려동물")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
    
//    private var registedPets: [Pet] {
//        data.dummyPets
//    }
}
