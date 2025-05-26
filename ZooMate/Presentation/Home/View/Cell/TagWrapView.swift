//
//  TagWrapView.swift
//  ZooMate
//
//  Created by Song Kim on 5/26/25.
//

import SwiftUI

struct TagWrapView: View {
    let tags: [String]

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .frame(height: self.calculateHeight())
    }

    @State private var totalHeight = CGFloat.zero

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(tags, id: \.self) { tag in
                self.tagView(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        if abs(width - dimension.width) > geometry.size.width {
                            width = 0
                            height -= dimension.height
                        }
                        let result = width
                        if tag == tags.last {
                            width = 0
                        } else {
                            width -= dimension.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if tag == tags.last {
                            height = 0
                        }
                        return result
                    })
            }
        }
        .background(viewHeightReader($totalHeight))
    }

    private func tagView(for text: String) -> some View {
        Text(text)
            .font(.notoSansRegular(size: 14))
            .foregroundColor(.brown)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.sandBeige)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.brown.opacity(0.5), lineWidth: 1)
            )
    }

    private func calculateHeight() -> CGFloat {
        return totalHeight
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geometry -> Color in
            DispatchQueue.main.async {
                binding.wrappedValue = geometry.size.height
            }
            return .clear
        }
    }
}
