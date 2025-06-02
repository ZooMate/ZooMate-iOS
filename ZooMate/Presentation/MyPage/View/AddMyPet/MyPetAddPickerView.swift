//
//  MyPetAddPickerView.swift
//  ZooMate
//
//  Created by 최준영 on 5/27/25.
//

import SwiftUI

struct MyPetAddPickerView: View {
    @Environment(\.dismiss) var dismiss
    var category: Category
    @Binding var isModal: Bool
    @State private var selectedItems: [(id: String, image: UIImage)] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("사진을 선택해주세요")
                        .font(.notoSansBold(size: 25))
                        .foregroundStyle(.mainText)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 1)
                    Text("최소 1장의 사진을 선택해주세요.")
                        .font(.notoSansMedium(size: 12))
                        .foregroundStyle(.subText)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 15)
                    GeometryReader { geo in
                        PetImageSelectedView(selectedItems: $selectedItems)
                    }
                    VStack {
                        if selectedItems.isEmpty {
                            Text("다음")
                                .nextBtnStyle()
                        } else {
                            NavigationLink(destination: MyPetAddProfileView1(isModal: $isModal)) {
                                Text("다음")
                                    .inputButtonStyle()
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.mainText)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}
