//
//  WebSocketManager.swift
//  ZooMate
//
//  Created by Song Kim on 6/11/25.
//

import Foundation

class WebSocketManager: ObservableObject {
    static let shared = WebSocketManager()

    private var webSocketTask: URLSessionWebSocketTask?
    private let urlSession = URLSession(configuration: .default)

    @Published var receivedMessages: [MessageResponse] = []

    func connect(roomId: Int) {
        let url = URL(string: "wss://your-server-url/ws/chat/\(roomId)")! // 서버에 맞게 수정
        webSocketTask = urlSession.webSocketTask(with: url)
        webSocketTask?.resume()
        receiveMessage()
    }

    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }

    func send(message: String, from petId: Int) {
        let json: [String: Any] = [
            "senderPetId": petId,
            "content": message
        ]
        let data = try! JSONSerialization.data(withJSONObject: json)
        let message = URLSessionWebSocketTask.Message.data(data)
        webSocketTask?.send(message) { error in
            if let error = error {
                print("웹소켓 전송 실패: \(error)")
            }
        }
    }

    private func receiveMessage() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                switch message {
                case .data(let data):
                    if let decoded = try? JSONDecoder().decode(MessageResponse.self, from: data) {
                        DispatchQueue.main.async {
                            self?.receivedMessages.append(decoded)
                        }
                    }
                case .string(let str):
                    print("수신된 문자열 메시지: \(str)")
                @unknown default:
                    break
                }
                self?.receiveMessage() // 계속 수신
            case .failure(let error):
                print("메시지 수신 실패: \(error)")
            }
        }
    }
}
