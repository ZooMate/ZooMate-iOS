//
//  ChatNetwork.swift
//  ZooMate
//
//  Created by Song Kim on 6/10/25.
//

import SwiftUI
import Alamofire

class ChatNetwork {
    static func fetchMyChatRoom(completion: @escaping (Result<[ChatRoomResponse], Error>) -> Void) {
        let url = "\(BaseURL.url)/chat/room"
        
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
            .responseDecodable(of: [ChatRoomResponse].self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
    }
    
    static func fetchChatRoomMessage(roomId: Int, completion: @escaping (Result<[MessageResponse], Error>) -> Void) {
        let url = "\(BaseURL.url)/chat/room/\(roomId)/messages"
        
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
            .responseDecodable(of: [MessageResponse].self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
    }
    
    static func createChatRoom(petId: [Int], completion: @escaping (Result<AddChatRoomResponse, Error>) -> Void) {
        let url = "\(BaseURL.url)/chat/room"
        
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
            "petIds": petId
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: AddChatRoomResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
    }
}
