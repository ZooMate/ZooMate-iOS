//
//  CategoryTabView.swift
//  ZooMate
//
//  Created by Song Kim on 5/23/25.
//

import SwiftUI

struct CategoryTabView: View {
    @Binding var selectedCategories: Set<Category>
    
    let categories = Category.allCases
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        Button {
                            toggleCategory(category)
                        } label: {
                            Text(category.displayName)
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
    
    private func toggleCategory(_ category: Category) {
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
        } else {
            selectedCategories.insert(category)
        }
    }
}
