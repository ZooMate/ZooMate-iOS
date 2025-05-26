//
//  CategoryList.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct CategoryList: View {
    
    @Binding var showCategory: Bool
    // MARK: 반려등록 뷰 - 카테고리 목록
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
                Button {
                } label: {
                    Text("조류")
                }
                Button {
                    
                } label: {
                    Text("파충류")
                }
                Button {
                    
                } label: {
                    Text("고양이")
                }
                Button {
                    
                } label: {
                    Text("강아지")
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
