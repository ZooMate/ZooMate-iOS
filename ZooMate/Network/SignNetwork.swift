//
//  SignNetwork.swift
//  ZooMate
//
//  Created by Song Kim on 6/4/25.
//

import SwiftUI
import Alamofire

class SignNetwork {
    static func login(userId: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "http://74.227.131.81/auth/login"
        
        let parameters: [String: Any] = [
            "userId": userId,
            "userPassword": password
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let data):
                    print("✅ 로그인 성공: \(data.accessToken)")
                    
                    let success: Bool
                    if KeychainHelper.read(forAccount: "token") == nil {
                        success = KeychainHelper.create(token: data.accessToken, forAccount: "token")
                    } else {
                        success = KeychainHelper.update(token: data.accessToken, forAccount: "token")
                    }
                    
                    guard success else {
                        completion(.failure(NSError(domain: "KeychainError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to save token to Keychain"])))
                        return
                    }
                    
                    UserNetwork.fetchMyData { result in
                        switch result {
                        case .success(let user):
                            MyData.shared.myInfo = user
                            completion(.success(data.accessToken))
                        case .failure(let fetchError):
                            print("❌ 사용자 정보 가져오기 실패: \(fetchError.localizedDescription)")
                            completion(.failure(fetchError)) // fetch 실패도 처리
                        }
                    }
                    
                case .failure(let error):
                    print("❌ 로그인 실패: \(error)")
                    completion(.failure(error))
                }
            }
    }
    
    static func logout() {
        KeychainHelper.delete(forAccount: "token")
        DispatchQueue.main.async {
            MyData.shared.clear()
        }
    }
}
