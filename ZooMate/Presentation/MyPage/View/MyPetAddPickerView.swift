//
//  MyPetAddPickerView.swift
//  ZooMate
//
//  Created by 최준영 on 5/27/25.
//

import SwiftUI

struct MyPetAddPickerView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    GeometryReader { geo in
                        Text("")
                    }
                    VStack {
                        Button {
                            
                        } label: {
                            Text("다음")
                        }
                        .nextBtnStyle()
                    }
                    
                }
            }
            .navigationTitle("사진을 선택해주세요")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
}

#Preview {
    MyPetAddPickerView()
}
