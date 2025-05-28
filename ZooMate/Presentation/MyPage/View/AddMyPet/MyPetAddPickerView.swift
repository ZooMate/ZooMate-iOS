//
//  MyPetAddPickerView.swift
//  ZooMate
//
//  Created by 최준영 on 5/27/25.
//

import SwiftUI

struct MyPetAddPickerView: View {
    
    var category: Category
    @Binding var isModal: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("사진을 선택해주세요")
                        .font(.notoSansBold(size: 30))
                        .padding(.horizontal)
                    GeometryReader { geo in
                        VStack() {
                            
                        }
                    }
                    VStack {
                        NavigationLink(destination: MyPetAddProfileView1(isModal: $isModal)) {
                            Button {
                                
                            } label: {
                                Text("다음")
                            }
                            .nextBtnStyle()
                        }
                    }
                    .padding(.bottom)
                }
            }
        }
    }
    
}
