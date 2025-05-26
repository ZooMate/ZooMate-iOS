//
//  CategoryTabView.swift
//  ZooMate
//
//  Created by Song Kim on 5/23/25.
//

import SwiftUI

struct CategoryTabView: View {
    @Binding var selectedCategories: Set<String>
    let categories = ["강아지", "고양이", "파충류", "조류"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        Button {
                            toggleCategory(category)
                        } label: {
                            Text(category)
                                .font(Font.notoSansBold(size: 12))
                                .foregroundStyle(.category)
                                .frame(width: geometry.size.width / 4.7, height: 30)
                                .background(
                                    ZStack {
                                        if selectedCategories.contains(category) {
                                            Capsule()
                                                .fill(Color.pointPink)
                                        }
                                        Capsule()
                                            .stroke(.category, lineWidth: 1.5)
                                    }
                                )
                        }
                        if category != categories.last {
                            Spacer()
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 10)
        }
    }
    
    private func toggleCategory(_ category: String) {
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
        } else {
            selectedCategories.insert(category)
        }
    }
}
