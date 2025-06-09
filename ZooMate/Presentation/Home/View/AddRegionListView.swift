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
    @State private var selectedCity: String? = nil
    @Binding var textMenu: String

    private var filteredCities: [String] {
        if searchText.isEmpty {
            return Array(cityDistricts.keys).sorted()
        } else {
            return cityDistricts.keys.filter { $0.localizedCaseInsensitiveContains(searchText) }.sorted()
        }
    }

    private var filteredDistricts: [String] {
        guard let selectedCity = selectedCity,
              let districts = cityDistricts[selectedCity] else { return [] }
        if searchText.isEmpty {
            return districts
        } else {
            return districts.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    TextField("지역 이름을 검색하세요", text: $searchText)
                        .padding(8)
                        .background(.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.category, lineWidth: 2)
                        )

                    Button(action: {
                        if selectedCity != nil {
                            selectedCity = nil
                            searchText = ""
                        } else {
                            dismiss()
                        }
                    }) {
                        Image(systemName: "xmark")
                            .bold()
                            .foregroundColor(.category)
                    }
                }
                .padding()

                if let selectedCity = selectedCity {
                    HStack {
                        Button(action: {
                            self.selectedCity = nil
                            self.searchText = ""
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.category)
                                .bold()
                        }
                        Text(selectedCity)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 16)
                }

                List {
                    if selectedCity == nil {
                        ForEach(filteredCities, id: \.self) { city in
                            Text(city)
                                .padding(.vertical, 8)
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .onTapGesture {
                                    selectedCity = city
                                    searchText = ""
                                }
                        }
                    } else {
                        ForEach(filteredDistricts, id: \.self) { district in
                            Text(district)
                                .padding(.vertical, 8)
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .onTapGesture {
                                    if let city = selectedCity {
                                        textMenu = "\(city) \(district)"
                                        dismiss()
                                    }
                                }
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
    AddRegionList(textMenu: .constant(""))
}
