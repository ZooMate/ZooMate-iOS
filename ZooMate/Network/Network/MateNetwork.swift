//
//  MateNetwork.swift
//  ZooMate
//
//  Created by Song Kim on 6/10/25.
//

import SwiftUI
import Alamofire

class MateNetwork {
    static func fetchMatePetList(completion: @escaping (Result<[PetList], Error>) -> Void) {
        let url = "\(BaseURL.url)/mate"
        
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
    
    static func fetchMatePetStatus(petId: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = "\(BaseURL.url)/mate/\(petId)/like"
        
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
            .responseDecodable(of: MatePetStatus.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.liked))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
    }
    
    static func createMate(petId: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = "\(BaseURL.url)/mate"
        
        guard let token = KeychainHelper.read(forAccount: "token") else {
            print("❌ Access Token이 없습니다.")
            completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Access Token이 없습니다."])))
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "accept": "*/*"
        ]
        
//        let parameters: [String: Any] = [
//            "userName": user.userName,
//            "region": user.region,  // ✅ 수정됨
//            "userDesc": user.userDesc ?? "",
//            "profile": user.profile ?? ""
//        ]
//        
//        AF.request(url, method: .get, encoding: URLEncoding.default, headers: headers)
//            .validate(statusCode: 200..<300)
//            .responseDecodable(of: MatePetStatus.self) { response in
//                switch response.result {
//                case .success(let data):
//                    completion(.success(data.liked))
//                case .failure(let err):
//                    completion(.failure(err))
//                }
//            }
    }
}
