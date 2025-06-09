//
//  PetDTO.swift
//  ZooMate
//
//  Created by Song Kim on 6/9/25.
//

import Foundation

// 반려동물 등록
struct AddPetRequest: Codable {
    var petName: String
    var age: Int
    var gender: String
    var isNeutering: Bool
    var isPublic: Bool
    var breed: String
    var weight: Float
    var petDesc: String
    var tag: [String]
    var photos: [Data]
    var category: String
}

// 반려동물 리스트
struct PetListResponse: Codable {
    let message: String
    let data: [PetList]
}

struct PetList: Codable {
    let id: Int
    let petName: String
    let age: Int
    let gender: String
    let breed: String
    let category: String
    let photos: [String]
    let owner: OwnerProfile
}

struct OwnerProfile: Codable{
    let profile: String
}

// 반려동물 디테일
struct PetDetailResponse: Codable {
    let message: String
    let data: PetDetail
}

struct PetDetail: Codable {
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
}

// 반려동물 수정 삭제 추가 - 성공여부만 리스폰
struct PetMsgResponse: Codable {
    let mesaage: String
}

// 반려동물 공개여부
struct PublicPetResponse: Codable {
    let message: String
    let data: String
}
