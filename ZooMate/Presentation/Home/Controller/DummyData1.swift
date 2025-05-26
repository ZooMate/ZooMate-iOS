//
//  DummyData.swift
//  ZooMate
//
//  Created by Song Kim on 5/23/25.
//

import SwiftUI

class DummyData1: ObservableObject {
    let dummyPets: [Pet] = [
        Pet(petId: "1", petName: "미미", age: 3, gender: .female, isNeutering: true, isPublic: true, breed: "페르시안", weight: 4.2, tag: ["온순함", "낮잠 좋아함"], photos: ["https://placekitten.com/300/300"], category: .cat, ownerId: "user1"),
        Pet(petId: "2", petName: "콩이", age: 2, gender: .male, isNeutering: false, isPublic: false, breed: "푸들", weight: 5.0, tag: ["활발함", "산책 좋아함"], photos: ["https://images.dog.ceo/breeds/poodle-toy/n02113624_9550.jpg"], category: .dog, ownerId: "user2"),
        Pet(petId: "3", petName: "짹짹이", age: 1, gender: .male, isNeutering: false, isPublic: true, breed: "잉꼬", weight: 0.08, tag: ["수다쟁이", "노래 잘함"], photos: ["https://farm4.staticflickr.com/3075/3168662394_7d7103de7d_z_d.jpg"], category: .bird, ownerId: "user3"),
        Pet(petId: "4", petName: "초코", age: 4, gender: .female, isNeutering: true, isPublic: true, breed: "닥스훈트", weight: 6.3, tag: ["애교많음", "소심함"], photos: ["https://images.dog.ceo/breeds/dachshund/n02085782_1100.jpg"], category: .dog, ownerId: "user4"),
        Pet(petId: "5", petName: "냥이", age: 5, gender: .female, isNeutering: true, isPublic: false, breed: "코리안숏헤어", weight: 3.7, tag: ["도도함"], photos: ["https://placekitten.com/301/301"], category: .cat, ownerId: "user5"),
        Pet(petId: "6", petName: "루비", age: 2, gender: .female, isNeutering: false, isPublic: true, breed: "비숑프리제", weight: 4.9, tag: ["사교적임", "장난기많음"], photos: ["https://images.dog.ceo/breeds/bichon/n02085936_10073.jpg"], category: .dog, ownerId: "user6"),
        Pet(petId: "7", petName: "해피", age: 1, gender: .male, isNeutering: false, isPublic: true, breed: "골든리트리버", weight: 10.0, tag: ["충성심", "운동좋아함"], photos: ["https://images.dog.ceo/breeds/retriever-golden/n02099601_3004.jpg"], category: .dog, ownerId: "user7"),
        Pet(petId: "8", petName: "소라", age: 3, gender: .female, isNeutering: true, isPublic: true, breed: "샴", weight: 3.5, tag: ["호기심많음"], photos: ["https://placekitten.com/302/302"], category: .cat, ownerId: "user8"),
        Pet(petId: "9", petName: "쿠쿠", age: 1, gender: .male, isNeutering: false, isPublic: false, breed: "앵무새", weight: 0.12, tag: ["말 많음", "밝은 성격"], photos: ["https://farm4.staticflickr.com/3075/3168662394_7d7103de7d_z_d.jpg"], category: .bird, ownerId: "user9"),
        Pet(petId: "10", petName: "슬기", age: 6, gender: .female, isNeutering: true, isPublic: true, breed: "시베리안 허스키", weight: 20.0, tag: ["지능높음", "활동적"], photos: ["https://images.dog.ceo/breeds/husky/n02110185_1469.jpg"], category: .dog, ownerId: "user10"),
        Pet(petId: "11", petName: "토리", age: 2, gender: .male, isNeutering: true, isPublic: true, breed: "코커스패니얼", weight: 7.5, tag: ["친근함", "장난꾸러기"], photos: ["https://images.dog.ceo/breeds/cocker-spaniel/n02102318_1000.jpg"], category: .dog, ownerId: "user11"),
        Pet(petId: "12", petName: "하늘", age: 3, gender: .female, isNeutering: false, isPublic: true, breed: "러시안블루", weight: 4.0, tag: ["조용함", "우아함"], photos: ["https://placekitten.com/303/303"], category: .cat, ownerId: "user12"),
        Pet(petId: "13", petName: "밤비", age: 1, gender: .female, isNeutering: false, isPublic: true, breed: "치와와", weight: 2.5, tag: ["작고 귀여움"], photos: ["https://images.dog.ceo/breeds/chihuahua/n02085620_10074.jpg"], category: .dog, ownerId: "user13"),
        Pet(petId: "14", petName: "구름", age: 4, gender: .male, isNeutering: true, isPublic: false, breed: "샤페이", weight: 8.0, tag: ["주름많음", "충성심"], photos: ["https://images.dog.ceo/breeds/sharpei/n02085782_1006.jpg"], category: .dog, ownerId: "user14"),
        Pet(petId: "15", petName: "별이", age: 2, gender: .female, isNeutering: true, isPublic: true, breed: "스코티시폴드", weight: 3.2, tag: ["귀접힘", "온순함"], photos: ["https://placekitten.com/304/304"], category: .cat, ownerId: "user15"),
        Pet(petId: "16", petName: "탄이", age: 3, gender: .male, isNeutering: false, isPublic: true, breed: "시바이누", weight: 9.0, tag: ["독립적", "활발함"], photos: ["https://images.dog.ceo/breeds/shiba/n02085782_1006.jpg"], category: .dog, ownerId: "user16"),
        Pet(petId: "17", petName: "몽이", age: 5, gender: .female, isNeutering: true, isPublic: true, breed: "믹스견", weight: 6.0, tag: ["다정함", "순함"], photos: ["https://images.dog.ceo/breeds/mix/n02110185_1469.jpg"], category: .dog, ownerId: "user17"),
        Pet(petId: "18", petName: "라라", age: 2, gender: .female, isNeutering: false, isPublic: true, breed: "아메리칸숏헤어", weight: 3.8, tag: ["활발함", "사교적"], photos: ["https://placekitten.com/305/305"], category: .cat, ownerId: "user18"),
        Pet(petId: "19", petName: "보리", age: 4, gender: .male, isNeutering: true, isPublic: false, breed: "말티즈", weight: 4.5, tag: ["애교많음", "소형견"], photos: ["https://images.dog.ceo/breeds/maltese/n02085936_10073.jpg"], category: .dog, ownerId: "user19"),
        Pet(petId: "20", petName: "하니", age: 3, gender: .female, isNeutering: true, isPublic: true, breed: "벵갈", weight: 4.0, tag: ["활동적", "호기심많음"], photos: ["https://placekitten.com/306/306"], category: .cat, ownerId: "user20")
    ]
    
    var dummyUsers: [User] {
        return [
            User(
                userId: "user1",
                userName: "유저1",
                password: "password123",
                region: "서초구",
                desc: "강남에 사는 고양이 집사입니다.",
                pets: [dummyPets[0], dummyPets[7], dummyPets[14]], // 미미, 소라, 별이
                profile: "https://example.com/profiles/user1.jpg"
            ),
            User(
                userId: "user2",
                userName: "유저2",
                password: "password123",
                region: "서초구",
                desc: "활동적인 강아지 좋아해요.",
                pets: [dummyPets[1], dummyPets[3]], // 콩이, 초코
                profile: "https://example.com/profiles/user2.jpg"
            ),
            User(
                userId: "user3",
                userName: "유저3",
                password: "password123",
                region: "서초구",
                desc: "새 친구 찾는 중이에요.",
                pets: [dummyPets[2], dummyPets[8]], // 짹짹이, 쿠쿠
                profile: "https://example.com/profiles/user3.jpg"
            ),
            User(
                userId: "user4",
                userName: "유저4",
                password: "password123",
                region: "용산구",
                desc: "강아지들과 함께 산책 즐겨요.",
                pets: [dummyPets[4], dummyPets[5], dummyPets[6]], // 냥이, 루비, 해피
                profile: "https://example.com/profiles/user4.jpg"
            ),
            User(
                userId: "user5",
                userName: "유저5",
                password: "password123",
                region: "은평구",
                desc: "혼자 키우는 고양이 있어요.",
                pets: [dummyPets[10]], // 토리
                profile: "https://example.com/profiles/user5.jpg"
            ),
            User(
                userId: "user6",
                userName: "유저6",
                password: "password123",
                region: "광진구",
                desc: "강아지 2마리 있어요!",
                pets: [dummyPets[11], dummyPets[12]], // 하늘, 밤비
                profile: "https://example.com/profiles/user6.jpg"
            ),
            User(
                userId: "user7",
                userName: "유저7",
                password: "password123",
                region: "구로구",
                desc: "혼자만의 시간도 좋아해요.",
                pets: [dummyPets[13]], // 구름
                profile: "https://example.com/profiles/user7.jpg"
            ),
            User(
                userId: "user8",
                userName: "유저8",
                password: "password123",
                region: "양천구",
                desc: "시바이누와 함께 살아요.",
                pets: [dummyPets[15]], // 탄이
                profile: "https://example.com/profiles/user8.jpg"
            ),
            User(
                userId: "user9",
                userName: "유저9",
                password: "password123",
                region: "동작구",
                desc: "믹스견 좋아해요.",
                pets: [dummyPets[16], dummyPets[18]], // 몽이, 보리
                profile: "https://example.com/profiles/user9.jpg"
            ),
            User(
                userId: "user10",
                userName: "유저10",
                password: "password123",
                region: "서초구",
                desc: "호기심 많은 벵갈 고양이 키워요.",
                pets: [dummyPets[19]], // 하니
                profile: "https://example.com/profiles/user10.jpg"
            )
        ]
    }

}
