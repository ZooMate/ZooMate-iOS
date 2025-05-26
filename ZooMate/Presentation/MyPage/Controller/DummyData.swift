//
//  DummyData.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

let pets: [Pet] = [
    Pet(petId: "pet1", petName: "시루", age: 2, gender: .female, isNeutering: true, isPublic: true, breed: "코리안 숏헤어", weight: 4.2, tag: ["온순함", "낮잠왕", "박스러버"], photos: ["https://images.unsplash.com/photo-1592194996308-7b43878e84a6?auto=format&fit=crop&w=400&q=80"], category: .cat, ownerId: "user123"),
    Pet(petId: "pet2", petName: "콩이", age: 3, gender: .male, isNeutering: false, isPublic: true, breed: "말티즈", weight: 3.1, tag: ["활발함", "애교쟁이"], photos: ["https://images.unsplash.com/photo-1601758064226-0c3c3c1e98ec?auto=format&fit=crop&w=400&q=80"], category: .dog, ownerId: "user123"),
    Pet(petId: "pet3", petName: "초코", age: 1, gender: .female, isNeutering: false, isPublic: false, breed: "앵무새", weight: 0.3, tag: ["수다쟁이", "호기심 많음"], photos: ["https://images.unsplash.com/photo-1579440916273-ea16c00b75c3?auto=format&fit=crop&w=400&q=80"], category: .bird, ownerId: "user123"),
    Pet(petId: "pet4", petName: "루비", age: 5, gender: .male, isNeutering: true, isPublic: true, breed: "비어디 드래곤", weight: 0.8, tag: ["조용함", "햇볕 좋아함"], photos: ["https://images.unsplash.com/photo-1593461790960-7a14028a62a6?auto=format&fit=crop&w=400&q=80"], category: .reptile, ownerId: "user123")
]

let users: [User] = [
    User(
        userId: "user123",
        userName: "완두콩 시루떡",
        password: "secure123",
        region: "성동구",
        desc: "박스 좋아하는 시루와 가족처럼 살고 있어요 ^^",
        pets: pets,
        profile: "https://i.imgur.com/QCNbOAo.png"
    )
]
