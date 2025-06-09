//
//  MyPetAddProfileView2.swift
//  ZooMate
//
//  Created by 최준영 on 5/27/25.
//

import SwiftUI

struct MyPetAddProfileView2: View {
    
    @State var breed: String? = nil
    @State var weight: String? = nil
    @State var desc: String = ""
    @State var tag: [String] = []
    @Binding var isModal: Bool
    
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
                            
                            TextField("슈나우저", text: Binding(
                                get: { breed ?? "" },
                                set: { breed = $0 }
                            ))
                            .sandTextFieldStyle(width: fieldWidth)
                        }
                        
                        HStack(alignment: .firstTextBaseline, spacing: 12) {
                            Text("무게")
                                .formLabelStyle(width: labelWidth)
                            
                            ZStack(alignment: .bottomTrailing){
                                TextField("3.5", text: Binding(
                                    get: { weight ?? "" },
                                    set: { weight = $0 }
                                ))
                                .keyboardType(.decimalPad)
                                .onChange(of: weight) {
                                    var filtered = weight?.filter { "0123456789.".contains($0) } ?? ""
                                    let components = filtered.split(separator: ".")
                                    if components.count > 1 {
                                        filtered = components[0] + "." + components[1...].joined()
                                    }
                                    weight = filtered
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
                            
                            TextEditor(text: Binding(
                                get: { desc },
                                set: { desc = $0 }
                            ))
                            .frame(height: 100)
                            .sandTextFieldStyle(width: fieldWidth)
                        }
                        
                        TagSelectionView(selectedTags: $tag)
                            .padding(.horizontal, -8)
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
