//
//  PetDTO.swift
//  ZooMate
//
//  Created by Song Kim on 6/9/25.
//

import Foundation

struct PetRequest: Encodable {
    var petName: String
    var age: Int
    var gender: String
    var isNeutering: Bool
    var isPublic: Bool
    var breed: String
    var weight: Float
    var petDesc: String
    var tag: [String]
    var photos: [String]
    var category: String
}

struct PetResponse: Codable {
    let id: Int
    let petName: String
    let age: Int
    let gender: String
    let isNeutering: Bool
    let isPublic: Bool
    let breed: String
    let weight: Float
    let petDesc: String
    let tag: [String]
    let photos: [String]
    let category: String
    let ownerId: Int
    let owner: Owner
    let petAttachments: [PetAttachment]
}

struct Owner: Codable {
    let id: Int
    let userId: String
    let userName: String
    let region: String
    let userDesc: String
    let profile: String
}

struct PetAttachment: Codable {
    // 구조가 비어 있으므로 빈 구조체로 정의
}

struct MyPetListResponse: Codable {
    let message: String
    let data: [MyPetList]
}

struct MyPetList: Codable {
    let id: Int
    let petName: String
    let age: Int
    let gender: String
    let photos: [String]
}
