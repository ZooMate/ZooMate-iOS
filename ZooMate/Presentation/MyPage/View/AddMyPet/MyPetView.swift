//
//  MyPetView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct MyPetView: View {
    @Binding var isOnDetail: Bool
    @StateObject var data = DummyData1()
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            let user = data.dummyUsers.first(where: { $0.id == MyData.shared.myInfo?.id })!
            let myPets = data.dummyPets.filter { $0.ownerId == MyData.shared.myInfo?.id }
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(myPets, id: \.id) { pet in
                        NavigationLink(
                            destination: MyPetDetailView(pet: pet)
                                .onAppear { isOnDetail = true }
                                .onDisappear { isOnDetail = false }
                        ) {
                            PetCardCell(pet: pet, user: user)
                        }
                    }
                }
                .padding(16)
                .navigationTitle("내 반려동물")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
