//
//  MyPetAddPickerView.swift
//  ZooMate
//
//  Created by 최준영 on 5/27/25.
//

import SwiftUI

struct SelectedImageItem: Equatable, Identifiable {
    let id: String
    let image: UIImage

    // Equatable을 수동으로 구현해야 UIImage 비교 가능 (id만 비교하도록 설정)
    static func == (lhs: SelectedImageItem, rhs: SelectedImageItem) -> Bool {
        lhs.id == rhs.id
    }
}

struct MyPetAddPickerView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isModal: Bool
    @Binding var addPet: AddPetRequest
    @State private var selectedItems: [SelectedImageItem] = []
    @Binding var petList: [PetList]
    
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
                                .grayButtonStyle()
                        } else {
                            NavigationLink(destination: MyPetAddProfileView1(isModal: $isModal, addPet: $addPet, petList: $petList)) {
                                Text("다음")
                                    .pinkButtonStyle()
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
            .onChange(of: selectedItems) {
                addPet.photos = selectedItems.compactMap { $0.image.jpegData(compressionQuality: 0.8) }
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
