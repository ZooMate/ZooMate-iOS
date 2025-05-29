//
//  DummyData.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

let pets: [Pet] = [
    Pet(id: 1, petName: "시루", age: 2, gender: .female, isNeutering: true, isPublic: true, breed: "코리안 숏헤어", weight: 4.2, tag: ["온순함", "낮잠왕", "박스러버"], photos: ["https://images.unsplash.com/photo-1494256997604-768d1f608cac?auto=format&fit=crop&w=800&q=80"], category: .cat, ownerId: 123),
    Pet(id: 2, petName: "절미", age: 3, gender: .male, isNeutering: false, isPublic: true, breed: "믹스견", weight: 3.1, tag: ["활발함", "애교쟁이"], photos: ["https://images.unsplash.com/photo-1507146426996-ef05306b995a?auto=format&fit=crop&w=800&q=80"], category: .dog, ownerId: 123),
    Pet(id: 3, petName: "앵무새", age: 1, gender: .female, isNeutering: false, isPublic: false, breed: "잉꼬", weight: 0.3, tag: ["수다쟁이", "엄살많음"], photos: ["https://images.unsplash.com/photo-1519003458034-e188874bb745?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .bird, ownerId: 123),
    Pet(id: 4, petName: "루비", age: 5, gender: .male, isNeutering: true, isPublic: true, breed: "비어디 드래곤", weight: 0.8, tag: ["조용함", "햇볕 좋아함"], photos: ["https://images.unsplash.com/photo-1707581103883-6e5b71db41ab?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .reptile, ownerId: 123)
]

let users: [User] = [
    User(
        id: 123,
        userId: "user1",
        userName: "완두콩 시루떡",
        password: "secure123",
        region: "성동구",
        desc: "박스 좋아하는 시루와 가족처럼 살고 있어요 ^^",
        pets: pets,
        profile: "https://i.imgur.com/QCNbOAo.png"
    )
]
