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
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(matedPets) { pet in
                        PetCardCell(pet: pet)
                    }
                }
                .padding(16)
                .navigationTitle("메이트")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    private var matedPets: [Pet] {
        data.dummyPets
    }
}
