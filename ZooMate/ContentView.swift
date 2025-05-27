//
//  ContentView.swift
//  ZooMate
//
//  Created by Song Kim on 5/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("홈", systemImage: "house") {
                MainHomeView()
            }
            Tab("채팅", systemImage: "message") {
                ChatMainView()
            }
            Tab("마이페이지", systemImage: "person.fill") {
                MyPageView(isLoggedIn: true)
            }
        }
        .tint(Color.mainText)
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = .subText
        }
    }
}

#Preview {
    ContentView()
}
