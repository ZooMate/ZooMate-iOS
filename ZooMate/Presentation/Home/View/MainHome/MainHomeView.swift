//
//  MainHomeView.swift
//  ZooMate
//
//  Created by Song Kim on 5/23/25.
//

import SwiftUI

struct MainHomeView: View {
    @ObservedObject var myData: MyData
    @State var allPetList: [PetList] = []
    @State var textMenu: String = "전체지역"
    @State var region: String = ""
    @State private var selectedCategories: Set<Category> = []
    @State private var showRegionSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    CategoryTabView(selectedCategories: $selectedCategories)
                        .frame(height: 45)
                    PetCardListView(myData: myData, allPetList: $allPetList, filteredCategories: selectedCategories, selectedRegion: textMenu)
                        .onAppear {
                            PetNetwork.fetchPetList { result in
                                switch result {
                                case .success(let data):
                                    allPetList = data
                                case .failure(let err):
                                    print(err)
                                }
                            }
                        }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Menu {
                            Button {
                                self.textMenu = "전체지역"
                            } label: {
                                Label {
                                    Text("전체지역")
                                } icon: {
                                    if textMenu == "전체지역" {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                            
                            Button {
                                self.textMenu = region
                            } label: {
                                Label {
                                    Text(region)
                                } icon: {
                                    if textMenu == region {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                            
                            Button {
                                showRegionSheet = true
                            } label: {
                                Text("다른지역 둘러보기")
                            }
                        } label: {
                            HStack {
                                Text(textMenu)
                                Image(systemName: "chevron.down")
                                    .resizable()
                                    .frame(width: 14, height: 10)
                            }
                        }
                        .font(.notoSansBold(size: 25))
                        .foregroundStyle(.mainText)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showRegionSheet) {
            AddRegionList(textMenu: $textMenu)
        }
        .onAppear {
            self.region = myData.myInfo?.region ?? "지역정보없음"
        }
    }
}
