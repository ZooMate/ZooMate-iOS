//
//  TagSelectionView.swift
//  ZooMate
//
//  Created by 최준영 on 5/27/25.
//

import SwiftUI

struct TagSelectionView: View {
    let allTags = ["다정함", "활동적", "활발함", "바보", "먹을게 최고", "유순함", "낯가림", "잠이 많음", "똑똑함", "쉽게 흥분함", "화가 많음", "느긋함"]
    
    @State private var selectedTags: Set<String> = []
    
    var body: some View {
        let columns = [GridItem(.adaptive(minimum: 100), spacing: 10)]
        
        VStack(alignment: .leading, spacing: 16) {
            Text("성격 태그")
                .font(.notoSansMedium(size: 17))
                .foregroundStyle(.mainText)
                .padding(.top, 8)
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 12) {
                ForEach(allTags, id: \.self) { tag in
                    Button(action: {
                        if selectedTags.contains(tag) {
                            selectedTags.remove(tag)
                        } else {
                            selectedTags.insert(tag)
                        }
                    }) {
                        Text(tag)
                            .font(.notoSansRegular(size: 14))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(
                                selectedTags.contains(tag) ? Color.sandBeige : Color.white
                            )
                            .foregroundColor(Color.category)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.category, lineWidth: 2)
                            )
                            .clipShape(Capsule())
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
}
