//
//  MyPetAddProfileView2.swift
//  ZooMate
//
//  Created by 최준영 on 5/27/25.
//

import SwiftUI

struct MyPetAddProfileView2: View {
    @State var breed: String = ""
    @State var weight: String = ""
    @State var desc: String = ""
    @State var tag: [String] = []
    @Binding var isModal: Bool
    @Binding var addPet: PetRequest
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            
            VStack(alignment: .leading) {
                Text("프로필을 입력해주세요")
                    .font(.notoSansBold(size: 25))
                    .foregroundStyle(.mainText)
                    .padding(.horizontal)
                GeometryReader { geo in
                    let labelWidth = geo.size.width * 0.2
                    let fieldWidth = geo.size.width * 0.6
                    
                    VStack {
                        HStack(alignment: .firstTextBaseline, spacing: 12) {
                            Text("품종")
                                .formLabelStyle(width: labelWidth)
                            
                            TextField("슈나우저", text: $breed)
                                .sandTextFieldStyle(width: fieldWidth)
                                .onChange(of: breed) {
                                    addPet.breed = breed
                                }
                        }
                        
                        HStack(alignment: .firstTextBaseline, spacing: 12) {
                            Text("무게")
                                .formLabelStyle(width: labelWidth)
                            
                            ZStack(alignment: .bottomTrailing) {
                                TextField("3.5", text: $weight)
                                    .keyboardType(.decimalPad)
                                    .onChange(of: weight) {
                                        var filtered = weight.filter { "0123456789.".contains($0) }
                                        let components = filtered.split(separator: ".")
                                        if components.count > 1 {
                                            filtered = components[0] + "." + components[1...].joined()
                                        }
                                        weight = filtered
                                        addPet.weight = Float(filtered) ?? 0.0
                                    }
                                    .sandTextFieldStyle(width: fieldWidth)
                                
                                Text("kg")
                                    .font(.notoSansMedium(size: 17))
                                    .foregroundStyle(.subText)
                                    .padding(.trailing, 15)
                                    .padding(.bottom, 18)
                            }
                        }
                        
                        HStack(alignment: .top, spacing: 12) {
                            Text("소개글 *")
                                .formLabelStyle(width: labelWidth)
                                .padding(.top, 10)
                            
                            TextEditor(text: $desc)
                            .frame(height: 100)
                            .sandTextFieldStyle(width: fieldWidth)
                            .onChange(of: desc) {
                                addPet.petDesc = desc
                            }
                        }
                        
                        TagSelectionView(selectedTags: $tag)
                            .padding(.horizontal, -8)
                            .onChange(of: tag) {
                                addPet.tag = tag
                            }
                    }
                    .padding(.top, 35)
                    .frame(width: geo.size.width)
                }
                VStack {
                    if desc.isEmpty || tag.isEmpty {
                        Text("확인")
                            .grayButtonStyle()
                    } else {
                        Button {
                            isModal = false
                            print(addPet)
                            PetNetwork.createPet(pet: addPet) { result in
                                switch result {
                                case .success(let data):
                                    print("성공: \(data)")
                                case .failure(let err):
                                    print("실패 \(err.localizedDescription)")
                                }
                            }
                        } label: {
                            Text("확인")
                                .pinkButtonStyle()
                        }
                    }
                }
                .padding(.bottom)
                
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}
