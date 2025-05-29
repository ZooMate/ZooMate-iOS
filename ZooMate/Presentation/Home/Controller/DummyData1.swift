//
//  DummyData.swift
//  ZooMate
//
//  Created by Song Kim on 5/23/25.
//

import SwiftUI

class DummyData1: ObservableObject {
    let dummyPets: [Pet] = [
        Pet(id: 1, petName: "미미", age: 3, gender: .female, isNeutering: true, isPublic: true, breed: "뱅갈", weight: 4.2, tag: ["온순함", "낮잠 좋아함"], photos: ["https://images.unsplash.com/photo-1518791841217-8f162f1e1131?auto=format&fit=crop&w=800&q=80"], category: .cat, ownerId: 1),
        Pet(id: 2, petName: "콩이", age: 2, gender: .male, isNeutering: false, isPublic: false, breed: "푸들", weight: 5.0, tag: ["활발함", "산책 좋아함", "온순함", "낮잠 좋아함", "수다쟁이", "노래 잘함"], photos: ["https://images.unsplash.com/photo-1596207143439-9a9fab470a06?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .dog, ownerId: 2),
        Pet(id: 3, petName: "짹짹이", age: 1, gender: .male, isNeutering: false, isPublic: true, breed: "잉꼬", weight: 0.08, tag: ["수다쟁이", "노래 잘함"], photos: ["https://farm4.staticflickr.com/3075/3168662394_7d7103de7d_z_d.jpg"], category: .bird, ownerId: 3),
        Pet(id: 4, petName: "초코", age: 4, gender: .female, isNeutering: true, isPublic: true, breed: "닥스훈트", weight: 6.3, tag: ["애교많음", "소심함"], photos: ["https://images.unsplash.com/photo-1604443587281-d1e823d31ad7?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .dog, ownerId: 4),
        Pet(id: 5, petName: "냥이", age: 5, gender: .female, isNeutering: true, isPublic: false, breed: "코리안숏헤어", weight: 3.7, tag: ["도도함"], photos: ["https://images.unsplash.com/photo-1543852786-1cf6624b9987?auto=format&fit=crop&w=800&q=80"], category: .cat, ownerId: 5),
        Pet(id: 6, petName: "루비", age: 2, gender: .female, isNeutering: false, isPublic: true, breed: "비숑프리제", weight: 4.9, tag: ["사교적임", "장난기많음"], photos: ["https://images.unsplash.com/photo-1587539975099-5aecb74902d4?q=80&w=2748&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .dog, ownerId: 6),
        Pet(id: 7, petName: "해피", age: 1, gender: .male, isNeutering: false, isPublic: true, breed: "골든리트리버", weight: 10.0, tag: ["충성심", "운동좋아함"], photos: ["https://images.dog.ceo/breeds/retriever-golden/n02099601_3004.jpg"], category: .dog, ownerId: 7),
        Pet(id: 8, petName: "소라", age: 3, gender: .female, isNeutering: true, isPublic: true, breed: "샴", weight: 3.5, tag: ["호기심많음"], photos: ["https://images.unsplash.com/photo-1741669625874-b5275957e088?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .cat, ownerId: 8),
        Pet(id: 9, petName: "쿠쿠", age: 1, gender: .male, isNeutering: false, isPublic: false, breed: "앵무새", weight: 0.12, tag: ["말 많음", "밝은 성격"], photos: ["https://images.unsplash.com/photo-1562085482-c34f886206da?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .bird, ownerId: 9),
        Pet(id: 10, petName: "슬기", age: 6, gender: .female, isNeutering: true, isPublic: true, breed: "시베리안 허스키", weight: 20.0, tag: ["지능높음", "활동적"], photos: ["https://images.dog.ceo/breeds/husky/n02110185_1469.jpg"], category: .dog, ownerId: 10),
        Pet(id: 11, petName: "토리", age: 2, gender: .male, isNeutering: true, isPublic: true, breed: "코커스패니얼", weight: 7.5, tag: ["친근함", "장난꾸러기"], photos: ["https://images.unsplash.com/photo-1651492017098-3229dc8a8d82?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .dog, ownerId: 1),
        Pet(id: 12, petName: "하늘", age: 3, gender: .female, isNeutering: false, isPublic: true, breed: "러시안블루", weight: 4.0, tag: ["조용함", "우아함"], photos: ["https://images.unsplash.com/photo-1479134262046-a470bfaf7a66?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .cat, ownerId: 2),
        Pet(id: 13, petName: "밤비", age: 1, gender: .female, isNeutering: false, isPublic: true, breed: "치와와", weight: 2.5, tag: ["작고 귀여움"], photos: ["https://images.unsplash.com/photo-1605630574100-cff6f7d2a948?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .dog, ownerId: 3),
        Pet(id: 14, petName: "구름", age: 4, gender: .male, isNeutering: true, isPublic: false, breed: "샤페이", weight: 8.0, tag: ["주름많음", "충성심"], photos: ["https://images.unsplash.com/photo-1664473404140-e6c388fffe75?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .dog, ownerId: 4),
        Pet(id: 15, petName: "별이", age: 2, gender: .female, isNeutering: true, isPublic: true, breed: "스코티시폴드", weight: 3.2, tag: ["귀접힘", "온순함"], photos: ["https://images.unsplash.com/photo-1685377507301-e01b4c17e1f0?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .cat, ownerId: 5),
        Pet(id: 16, petName: "탄이", age: 3, gender: .male, isNeutering: false, isPublic: true, breed: "시바이누", weight: 9.0, tag: ["독립적", "활발함"], photos: ["https://images.unsplash.com/photo-1678869848634-9a17e71023c9?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .dog, ownerId: 6),
        Pet(id: 17, petName: "몽이", age: 5, gender: .female, isNeutering: true, isPublic: true, breed: "믹스견", weight: 6.0, tag: ["다정함", "순함"], photos: ["https://images.unsplash.com/photo-1528919632209-de1db1493d97?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .dog, ownerId: 7),
        Pet(id: 18, petName: "라라", age: 2, gender: .female, isNeutering: false, isPublic: true, breed: "아메리칸숏헤어", weight: 3.8, tag: ["활발함", "사교적"], photos: ["https://images.unsplash.com/photo-1638667168631-f915859b80bc?q=80&w=2680&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .cat, ownerId: 8),
        Pet(id: 19, petName: "보리", age: 4, gender: .male, isNeutering: true, isPublic: false, breed: "말티즈", weight: 4.5, tag: ["애교많음", "소형견"], photos: ["https://images.dog.ceo/breeds/maltese/n02085936_10073.jpg"], category: .dog, ownerId: 9),
        Pet(id: 20, petName: "하니", age: 3, gender: .female, isNeutering: true, isPublic: true, breed: "개구리", weight: 4.0, tag: ["활동적", "호기심많음"], photos: ["https://images.unsplash.com/photo-1534062518571-b4d839eac102?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"], category: .reptile, ownerId: 10)
    ]
    
    var dummyMates: [Mate] {
        return [
            Mate(userrId: 6, petId: 8),
            Mate(userrId: 6, petId: 9),
            Mate(userrId: 6, petId: 10)
        ]
    }
    
    var dummyUsers: [User] {
        return [
            User(
                id: 1,
                userId: "user1",
                userName: "유저1",
                password: "password123",
                region: "서초구",
                desc: "강남에 사는 고양이 집사입니다.",
                pets: [dummyPets[0], dummyPets[10]],
                profile: "https://image.hanssem.com/hsimg/gds/1050/1060/1060049_B1.jpg?v=20250114075010"
            ),
            User(
                id: 2,
                userId: "user1",
                userName: "유저2",
                password: "password123",
                region: "서초구",
                desc: "활동적인 강아지 좋아해요.",
                pets: [dummyPets[1], dummyPets[11]],
                profile: "https://www.urbanbrush.net/web/wp-content/uploads/edd/2023/11/urban-20231115105709412694.jpg"
            ),
            User(
                id: 3,
                userId: "user1",
                userName: "유저3",
                password: "password123",
                region: "서초구",
                desc: "새 친구 찾는 중이에요.",
                pets: [dummyPets[2], dummyPets[12]],
                profile: "https://item.kakaocdn.net/do/28f43fcbc759a15849b864d3c8ad1efdf604e7b0e6900f9ac53a43965300eb9a"
            ),
            User(
                id: 4,
                userId: "user1",
                userName: "유저4",
                password: "password123",
                region: "용산구",
                desc: "강아지들과 함께 산책 즐겨요.",
                pets: [dummyPets[3], dummyPets[13]],
                profile: "https://static.inven.co.kr/column/2022/07/08/news/i8261936733.jpg"
            ),
            User(
                id: 5,
                userId: "user1",
                userName: "유저5",
                password: "password123",
                region: "은평구",
                desc: "혼자 키우는 고양이 있어요.",
                pets: [dummyPets[4], dummyPets[14]],
                profile: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG5QTJkZMMaFKrGcJMy_11dkaRCMIVnGpdig&s"
            ),
            User(
                id: 6,
                userId: "user1",
                userName: "유저6",
                password: "password123",
                region: "광진구",
                desc: "강아지 2마리 있어요!",
                pets: [dummyPets[5], dummyPets[15]],
                profile: "https://img.freepik.com/free-vector/cute-kid-girl-holding-camera-hand-drawn-cartoon-character-illustration_56104-1858.jpg?semt=ais_hybrid&w=740"
            ),
            User(
                id: 7,
                userId: "user1",
                userName: "유저7",
                password: "password123",
                region: "구로구",
                desc: "혼자만의 시간도 좋아해요.",
                pets: [dummyPets[6], dummyPets[16]],
                profile: "https://amunoriter.com/wp-content/uploads/2023/02/logo-amunoriter600.png"
            ),
            User(
                id: 8,
                userId: "user1",
                userName: "유저8",
                password: "password123",
                region: "양천구",
                desc: "시바이누와 함께 살아요.",
                pets: [dummyPets[7], dummyPets[17]],
                profile: "https://cdn.mapianist.com/img_content/jpg/11b83ddc-5b37-4fe1-9b1d-18d71d08c4f2-1666594814.jpg"
            ),
            User(
                id: 9,
                userId: "user1",
                userName: "유저9",
                password: "password123",
                region: "동작구",
                desc: "믹스견 좋아해요.",
                pets: [dummyPets[8], dummyPets[18]],
                profile: "https://blog.kakaocdn.net/dn/cWeaDa/btsDGWdIslC/oBGEcplwD5D4Nr8gP7i9x0/img.png"
            ),
            User(
                id: 10,
                userId: "user1",
                userName: "유저10",
                password: "password123",
                region: "서초구",
                desc: "호기심 많은 벵갈 고양이 키워요.",
                pets: [dummyPets[9], dummyPets[19]],
                profile: "https://health.chosun.com/site/data/img_dir/2022/01/19/2022011901997_0.jpg"
            )
        ]
    }

}
