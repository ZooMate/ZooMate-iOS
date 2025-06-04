//
//  MyData.swift
//  ZooMate
//
//  Created by Song Kim on 5/29/25.
//

import Foundation
import Security

class MyData {
    static var myId = 6 // 토큰 불러오는데 성공하면 id값 저장해주기 (이래야 사용하기 편함)
    static var token = KeychainHelper.read(forAccount: "token") ?? ""
}

class KeychainHelper {
    static let serviceName = "Ourry"
    
    // 키체인 추가
    @discardableResult
    static func create(token: String, forAccount account: String) -> Bool {
        
        let keychainItem = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: serviceName,
            kSecValueData: token.data(using: .utf8) as Any
        ] as [String: Any]
        
        let status = SecItemAdd(keychainItem as CFDictionary, nil)
        guard status == errSecSuccess else {
            print("Keychain create Error")
            return false
        }
        return true
    }
    
    // 키체인 읽기
    static func read(forAccount account: String) -> String? {
        let keychainItem = [
                    kSecClass: kSecClassGenericPassword,
                    kSecAttrAccount: account,
                    kSecAttrService: serviceName,
                    kSecReturnData: true
                ] as [String: Any]
        
        var item: AnyObject?
        let status = SecItemCopyMatching(keychainItem as CFDictionary, &item)
        if status == errSecSuccess {
            return String(data: item as! Data, encoding: .utf8)
        }
        
        if status == errSecItemNotFound {
            print("The token was not found in keychain")
            return nil
        } else {
            print("Error getting token from keychain: \(status)")
            return nil
        }
    }
    
    // 키체인 업데이트
    @discardableResult
    static func update(token: String, forAccount account: String) -> Bool{
        let keychainItem = [
            kSecClass: kSecClassGenericPassword
        ] as [String: Any]

        let attributes = [
            kSecAttrService: serviceName,
            kSecAttrAccount: account,
            kSecValueData: token.data(using: .utf8) as Any
        ]

        let status = SecItemUpdate(keychainItem as CFDictionary, attributes as CFDictionary)
        guard status != errSecItemNotFound else {
            print("The token was not found in keychain")
            return false
        }

        guard status == errSecSuccess else {
            print("Keychain update Error")
            return false
        }
        
        print("The token in keychain is updated")
        return true
    }
    
    // 키체인 삭제
    @discardableResult
    static func delete(forAccount account: String) -> Bool{
        let keychainItem = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: serviceName,
            kSecAttrAccount: account
        ] as [String: Any]

        let status = SecItemDelete(keychainItem as CFDictionary)
        guard status != errSecItemNotFound else {
            print("The token was not found in keychain")
            return false
        }
        guard status == errSecSuccess else {
            print("Keychain delete Error")
            return false
        }
        print("The token in keychain is deleted")
        return true
    }
}
