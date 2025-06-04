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
    @StateObject var data = DummyData1()
    
    var isNewUser: Bool = false
    
    var body: some View {
        let user = data.dummyUsers.first(where: { $0.id == MyData.shared.myId })!
        
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
                if !isNewUser ,let profile = user.profile, !profile.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
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
                                    .stroke(.sandBeige, lineWidth: 3)
                            )
                        Image(systemName: "camera")
                            .font(.system(size: 40))
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
