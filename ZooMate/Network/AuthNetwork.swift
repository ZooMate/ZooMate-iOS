//
//  SignNetwork.swift
//  ZooMate
//
//  Created by Song Kim on 6/4/25.
//

import SwiftUI
import Alamofire

class AuthNetwork {
    // 회원가입
    static func signupUser(user: SignupRequest, completion: @escaping (Result<SignupResponse, Error>) -> Void) {
        let url = "http://localhost:3000/user/signup"
        
        AF.request(url,
                   method: .post,
                   parameters: user,
                   encoder: JSONParameterEncoder.default,
                   headers: [.contentType("application/json")]
        ).validate(statusCode: 200..<300)
         .responseDecodable(of: SignupResponse.self) { response in
            switch response.result {
            case .success(let signupResponse):
                completion(.success(signupResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // 회원탈퇴
    static func deleteUser(completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = "\(BaseURL.url)/user/me"

        guard let token = KeychainHelper.read(forAccount: "token") else {
            print("❌ Access Token이 없습니다.")
            completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Access Token이 없습니다."])))
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "accept": "*/*"
        ]

        AF.request(url, method: .delete, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: DeleteUserResponse.self) { response in
                switch response.result {
                case .success(_):
                    completion(.success(true))
                case .failure(let error):
                    print("❌ 탈퇴 실패: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }
    
    // 아이디 중복검사
    static func checkId(userId: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = "\(BaseURL.url)/user/checkId"
        
        let parameters: [String: Any] = [
            "userId": userId
        ]
        
        print(userId)
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: CheckIdResponse.self) { response in
                switch response.result {
                case .success(let res):
                    completion(.success(res.isTaken))
                case .failure(let err):
                    print(err)
                }
                
            }
    }
    
    // 비밀번호 변경
    static func changePassword() {
        
    }
    
    // 로그인
    static func login(userId: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "\(BaseURL.url)/user/login"
        
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
                    completion(.success(data.accessToken))
                case .failure(let error):
                    print("❌ 로그인 실패: \(error)")
                    completion(.failure(error))
                }
            }
    }
    
    // 로그아웃
    static func logout(myData: MyData) {
        KeychainHelper.delete(forAccount: "token")
        DispatchQueue.main.async {
            myData.clear()
        }
    }
}
