//
//  MyPetListView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct MyPetListView: View {
    @State private var showCategory = false
    @State private var selectedCategory: Category? = nil
    @State private var isOnDetail = false
    
    var body: some View {
        ZStack {
            if let category = selectedCategory {
                MyPetAddPickerView(
                    category: category,
                    onBack: {
                        selectedCategory = nil
                    }
                )
            } else {
                MyPetView(isOnDetail: $isOnDetail)
                
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
        }
        .overlay {
            if showCategory {
                CategoryList(showCategory: $showCategory)
            }
        }
    }
}

#Preview {
    MyPetListView()
}
