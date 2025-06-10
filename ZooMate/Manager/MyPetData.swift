//
//  MyPetData.swift
//  ZooMate
//
//  Created by Song Kim on 6/11/25.
//

import Foundation

import Foundation

class MyPetData: ObservableObject {
    @Published var pets: [PetList] = []
    
    init() {
        fetchPets()
    }
    
    func fetchPets() {
        PetNetwork.fetchMyPetList { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedPets):
                    self.pets = fetchedPets
                case .failure(let error):
                    print("❌ 내 반려동물 불러오기 실패:", error)
                }
            }
        }
    }
    
    func refresh() {
        fetchPets()
    }
}
