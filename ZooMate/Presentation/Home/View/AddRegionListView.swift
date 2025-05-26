//
//  AddRegionList.swift
//  ZooMate
//
//  Created by Song Kim on 5/26/25.
//

import SwiftUI

struct AddRegionList: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    @Binding var chooseMenu: String
    @Binding var textMenu: String
    
    private let regions: [String] = [
        "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구",
        "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구",
        "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구",
        "가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시",
        "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시",
        "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시",
        "평택시", "포천시", "하남시", "화성시"
    ]
    
    private var filteredRegions: [String] {
        if searchText.isEmpty {
            return regions
        } else {
            return regions.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .bold()
                            .foregroundColor(.category)
                    }
                    .padding(.trailing, 6)
                    
                    TextField("지역 이름을 검색하세요", text: $searchText)
                        .padding(8)
                        .background(.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.category, lineWidth: 2)
                        )
                }
                .padding()
                
                List {
                    ForEach(filteredRegions, id: \.self) { region in
                        Text(region)
                            .padding(.vertical, 8)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                chooseMenu = region
                                textMenu = region
                                dismiss()
                            }
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    MainHomeView()
}
