//
//  MyData.swift
//  ZooMate
//
//  Created by Song Kim on 5/29/25.
//

import Foundation

class MyData: ObservableObject {
    static let shared = MyData()
    
    @Published var myInfo: UserResponse? {
        didSet {
            saveToUserDefaults() // 값이 바뀌면 자동으로 저장
        }
    }
    
    private let userDefaultsKey = "myInfo"

    init() {
        loadFromUserDefaults()
    }

    private func saveToUserDefaults() {
        guard let info = myInfo else {
            UserDefaults.standard.removeObject(forKey: userDefaultsKey)
            return
        }
        if let encoded = try? JSONEncoder().encode(info) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    private func loadFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode(UserResponse.self, from: data) {
            myInfo = decoded
        }
    }
    
    func save() {
        saveToUserDefaults()
    }

    func clear() {
        myInfo = nil
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }
}
