//
//  UserNetwork.swift
//  ZooMate
//
//  Created by Song Kim on 6/5/25.
//

import SwiftUI
import Alamofire

class UserNetwork {
    static func fetchMyData(completion: @escaping (Result<UserResponse, Error>) -> Void) {
        let url = "http://74.227.131.81/users/me"

        guard let token = KeychainHelper.read(forAccount: "token") else {
            print("❌ Access Token이 없습니다.")
            completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Access Token이 없습니다."])))
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "accept": "*/*"
        ]

        AF.request(url, method: .get, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: UserResponse.self) { response in
                switch response.result {
                case .success(let userData):
                    print("✅ 사용자 정보 조회 성공: \(userData)")
                    completion(.success(userData))
                case .failure(let error):
                    print("❌ 사용자 정보 가져오기 실패: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }

    static func updateUserInfo(user: UserResponse, completion: @escaping (Result<UserEditResponse, Error>) -> Void) {
        guard let url = URL(string: "http://74.227.131.81/users/me") else {
            print("Invalid URL")
            return
        }
        
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
            "userName": user.userName,
            "userPassword": user.userPassword,
            "region": user.region,  // ✅ 수정됨
            "userDesc": user.userDesc,
            "profile": user.profile
        ]
        
        AF.request(url, method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: UserEditResponse.self) { response in
                switch response.result {
                case .success(let data):
                    print("✅ 프로필 업데이트 성공: \(data)")
                    completion(.success(data))
                case .failure(let error):
                    print("❌ 업데이트 실패: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }
}
