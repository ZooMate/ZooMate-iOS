//
//  PetImageSelectedView.swift
//  ZooMate
//
//  Created by 최준영 on 5/31/25.
//

import SwiftUI
import Kingfisher

struct PetImageSelectedView: View {
    @Binding var selectedItems: [SelectedImageItem]
    @State private var isPickerPresented = false

    private let imageSize: CGFloat = 116
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    Button {
                        isPickerPresented = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(width: imageSize, height: imageSize)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 22)
                                        .stroke(.sandBeige, lineWidth: 2)
                                )
                                .padding(2)
                            Image(systemName: "camera")
                                .font(.system(size: 30))
                                .foregroundColor(.category)
                        }
                    }

                    ForEach(selectedItems, id: \.id) { item in
                        Image(uiImage: item.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay(
                                RoundedRectangle(cornerRadius: 22)
                                    .stroke(.sandBeige, lineWidth: 2)
                            )
                            .padding(2)
                            .clipped()
                    }
                }
                .padding(.horizontal)
            }
        }
        .sheet(isPresented: $isPickerPresented) {
            PHPickerMultiImage(selectedItems: $selectedItems)
        }
    }
}
