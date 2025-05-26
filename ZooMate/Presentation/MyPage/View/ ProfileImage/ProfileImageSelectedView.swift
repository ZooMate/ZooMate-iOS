//
//  ProfileImageSelectedView.swift
//  ZooMate
//
//  Created by 최준영 on 5/24/25.
//
import SwiftUI
import Kingfisher

struct ProfileImageSelectedView: View {
    
    @Binding var selectedImage: UIImage?
    @State private var isPickerPresented = false
    
    private let user = users[0]
    
    var body: some View {
        Button {
            isPickerPresented = true
        }
        label: {
            // MARK: 이미지 선택 여부에 따른 이미지 출력
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.sandBeige, lineWidth: 2)
                    )
            }
            else {
                if let profile = user.profile, !profile.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                {
                    KFImage(URL(string: profile))
                        .placeholder {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .frame(width: 100, height: 100)
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                }
                else {
                    ZStack {
                        Circle().fill(Color.white)
                            .frame(width: 100, height: 100)
                            .overlay(
                                Circle()
                                    .stroke(.category, lineWidth: 2)
                            )
                        Image(systemName: "person")
                            .font(.system(size: 50))
                            .foregroundColor(.sandBeige)
                    }
                }
            }
        }
        .sheet(isPresented: $isPickerPresented) {
            PHPickerRep(image: $selectedImage)
        }
    }
}
