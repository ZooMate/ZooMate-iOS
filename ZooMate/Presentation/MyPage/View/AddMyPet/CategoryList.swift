//
//  CategoryList.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct CategoryList: View {
    
    @Binding var showCategory: Bool
    
    var onSelect: (Category) -> Void

    var body: some View {
            ZStack {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showCategory = false
                        }
                    }

                VStack(spacing: 15) {
                    ForEach([Category.bird, .reptile, .cat, .dog], id: \.self) { category in
                        Button {
                            withAnimation {
                                showCategory = false
                            }
                            onSelect(category)
                        } label: {
                            Text(category.rawValue)
                                .font(.notoSansMedium(size: 18))
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding(15)
                .padding(.horizontal, 60)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .foregroundStyle(.mainText)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(35)
                .padding(.bottom, 30)
                .padding(.horizontal, 30)
            }
        }
    }
