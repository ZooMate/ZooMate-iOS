//
//  PetNetwork.swift
//  ZooMate
//
//  Created by Song Kim on 6/9/25.
//

import SwiftUI
import Alamofire

class PetNetwork {
    static func createPet(pet: PetRequest, completion: @escaping (Result<PetResponse, Error>) -> Void) {
        let url = "\(BaseURL.url)/pet"
        
        guard let token = KeychainHelper.read(forAccount: "token") else {
            print("❌ Access Token이 없습니다.")
            completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Access Token이 없습니다."])))
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "accept": "*/*"
        ]
        
        let parameters: [String: Any] = [
            "petName": pet.petName,
            "age": pet.age,
            "gender": pet.gender,
            "isNeutering": pet.isNeutering,
            "isPublic": pet.isPublic,
            "breed": pet.breed,
            "weight": pet.weight,
            "petDesc": pet.petDesc,
            "tag": pet.tag,
            "photos": pet.photos,
            "category": pet.category
        ]

        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: PetResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
    }
    
    static func fetchMyPetList(completion: @escaping (Result<[MyPetList], Error>) -> Void) {
        let url = "\(BaseURL.url)/pet/myList"
        
        guard let token = KeychainHelper.read(forAccount: "token") else {
            print("❌ Access Token이 없습니다.")
            completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Access Token이 없습니다."])))
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "accept": "*/*"
        ]
        
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: MyPetListResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.data))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
    }
    
    static func fetchPetDetailData(petId: Int, completion: @escaping (Result<PetDetail, Error>) -> Void) {
        let url = "\(BaseURL.url)/pet/\(petId)"
        
        guard let token = KeychainHelper.read(forAccount: "token") else {
            print("❌ Access Token이 없습니다.")
            completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Access Token이 없습니다."])))
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "accept": "*/*"
        ]
        
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: PetDetailResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.data))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
    }
}
