//
//  ContentView.swift
//  ZooMate
//
//  Created by Song Kim on 5/22/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var myData = MyData()
    
    var body: some View {
        TabView {
            Tab("홈", systemImage: "house") {
                MainHomeView(myData: myData)
            }
            Tab("채팅", systemImage: "message") {
                ChatMainView()
            }
            Tab("마이페이지", systemImage: "person.fill") {
                MyPageView(myData: myData, isLoggedIn: myData.myInfo != nil)
            }
        }
        .background(Color.background)
        .tint(Color.mainText)
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = .subText
        }
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            
            let backItemAppearance = UIBarButtonItemAppearance()
            backItemAppearance.normal.titleTextAttributes = [
                .foregroundColor : UIColor.clear
            ]
            appearance.backButtonAppearance = backItemAppearance
            
            let image = UIImage(systemName: "chevron.backward")?
                .withTintColor(
                    .mainText,
                    renderingMode: .alwaysOriginal
                )
                .withAlignmentRectInsets(
                    UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
                )
            appearance.setBackIndicatorImage(image, transitionMaskImage: image)

            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    ContentView()
}
