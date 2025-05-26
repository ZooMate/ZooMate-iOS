//
//  MainHomeView.swift
//  ZooMate
//
//  Created by Song Kim on 5/23/25.
//

import SwiftUI

struct MainHomeView: View {
    @State var textMenu: String = "전체지역"
    @State var chooseMenu: String = "강동구"
    @State private var selectedCategories: Set<String> = []
    @State private var showRegionSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack {
                    CategoryTabView(selectedCategories: $selectedCategories)
                        .frame(height: 45)
                    PetCardListView(filteredCategories: selectedCategories, selectedRegion: textMenu)
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
                                self.textMenu = chooseMenu
                            } label: {
                                Label {
                                    Text(chooseMenu)
                                } icon: {
                                    if textMenu == chooseMenu {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                            
                            Button {
                                showRegionSheet = true
                            } label: {
                                Text("지역 선택하기")
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
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            // 액션
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.mainText)
                        }
                        .frame(width: 20)
                        
                        Button {
                            // 액션
                        } label: {
                            Image(systemName: "bell")
                                .foregroundStyle(.mainText)
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showRegionSheet) {
            AddRegionList(chooseMenu: $chooseMenu, textMenu: $textMenu)
        }
    }
}


#Preview {
    MainHomeView()
}
