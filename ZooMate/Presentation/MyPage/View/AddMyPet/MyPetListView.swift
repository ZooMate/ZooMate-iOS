//
//  MyPetListView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct MyPetListView: View {
    @ObservedObject var myData: MyData
    @Binding var myPetList: [PetList]
    let title: String
    @State private var showCategory = false
    @State private var selectedCategory: Category? = nil
    @State private var isOnDetail = false

    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            
            if myData.myInfo == nil {
                LoginPromptView()
            } else {
                if myPetList.isEmpty {
                    VStack {
                        Spacer()
                        Text(title == "내 반려동물" ? "내 반려동물이 없습니다." : "즐겨찾기한 동물이 없습니다.")
                            .font(.notoSansRegular(size: 16))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                } else {
                    MyPetView(isOnDetail: $isOnDetail, myPetList: $myPetList, myData: myData)
                }

                if title == "내 반려동물" {
                    Button {
                        showCategory.toggle()
                    } label: {
                        ZStack {
                            Circle().fill(.pointPink)
                                .frame(width: 70 , height: 70)
                            Image(systemName: "plus")
                                .font(.system(size: 35))
                                .foregroundColor(.category)
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding()
                }

                if showCategory {
                    CategoryList(showCategory: $showCategory, petList: $myPetList)
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(title)
    }
}
