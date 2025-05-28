//
//  ProfileImageView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct ProfileImageView: View {
    // MARK: 기본 프로필 이미지 뷰
    var body: some View {
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

#Preview {
    ProfileImageView()
}
