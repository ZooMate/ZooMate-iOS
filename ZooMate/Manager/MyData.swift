//
//  MyData.swift
//  ZooMate
//
//  Created by Song Kim on 5/29/25.
//

import Foundation

class MyData: ObservableObject {
    static let shared = MyData()
    
    @Published var token: String = KeychainHelper.read(forAccount: "token") ?? ""
    @Published var myId: Int = 6
}
