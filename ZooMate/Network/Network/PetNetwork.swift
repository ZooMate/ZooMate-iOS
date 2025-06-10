//
//  PetNetwork.swift
//  ZooMate
//
//  Created by Song Kim on 6/9/25.
//

import SwiftUI
import Alamofire

class PetNetwork {
    static func createPet(pet: AddPetRequest, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "\(BaseURL.url)/pet"
        
        guard let token = KeychainHelper.read(forAccount: "token") else {
            print("❌ Access Token이 없습니다.")
            completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Access Token이 없습니다."])))
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "accept": "*/*",
            "Content-Type": "multipart/form-data"
        ]
        
        AF.upload(multipartFormData: { multipart in
            multipart.append(Data(pet.petName.utf8), withName: "petName")
            multipart.append(Data("\(pet.age)".utf8), withName: "age")
            multipart.append(Data(pet.gender.utf8), withName: "gender")
            multipart.append(Data("\(pet.isNeutering)".utf8), withName: "isNeutering")
            multipart.append(Data("\(pet.isPublic)".utf8), withName: "isPublic")
            multipart.append(Data(pet.breed.utf8), withName: "breed")
            multipart.append(Data("\(pet.weight)".utf8), withName: "weight")
            multipart.append(Data(pet.petDesc.utf8), withName: "petDesc")
            multipart.append(Data(pet.category.utf8), withName: "category")
            
            // tag 배열
            for tag in pet.tag {
                multipart.append(Data(tag.utf8), withName: "tag")
            }
            
            // 사진 배열 (Data 타입)
            let photos = pet.photos
            for (index, imageData) in photos.enumerated() {
                multipart.append(imageData, withName: "photos", fileName: "photo\(index).jpg", mimeType: "image/jpeg")
                
            }
        }, to: url, headers: headers)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: PetMsgResponse.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data.message))
            case .failure(let err):
                print("❌ Upload 실패: \(err.localizedDescription)")
                completion(.failure(err))
            }
        }
    }
    
    static func fetchMyPetList(completion: @escaping (Result<[PetList], Error>) -> Void) {
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
            .responseDecodable(of: PetListResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.data))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
    }
    
    static func fetchPetList(completion: @escaping (Result<[PetList], Error>) -> Void) {
        let url = "\(BaseURL.url)/pet/list"
        
        AF.request(url, method: .get, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: PetListResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.data))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
    }
    
    static func fetchMyPetDetailData(petId: Int, completion: @escaping (Result<PetDetail, Error>) -> Void) {
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
    
    static func fetchPetDetailData(petId: Int, completion: @escaping (Result<PetDetail, Error>) -> Void) {
        let url = "\(BaseURL.url)/pet/\(petId)"
        
        AF.request(url, method: .get, encoding: URLEncoding.default)
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
    
    static func updateMyPetPublic(petId: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = "\(BaseURL.url)/pet/\(petId)/public"
        
        guard let token = KeychainHelper.read(forAccount: "token") else {
            print("❌ Access Token이 없습니다.")
            completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Access Token이 없습니다."])))
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "accept": "*/*"
        ]
        
        AF.request(url, method: .patch, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: PublicPetResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.data))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
    }
}
