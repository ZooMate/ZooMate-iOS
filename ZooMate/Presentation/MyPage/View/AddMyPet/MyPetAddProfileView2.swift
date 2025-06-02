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
    @State var desc: String? = ""
    @State var tag: [String] = []
    @Binding var isModal: Bool
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("프로필을 입력해주세요")
                    .font(.notoSansBold(size: 25))
                    .foregroundStyle(.mainText)
                    .padding(.horizontal)
                GeometryReader { geo in
                    VStack {
                        HStack(spacing: 12) {
                            Text("품종")
                                .frame(width: geo.size.width * 0.2, alignment: .leading)
                                .font(.notoSansMedium(size: 17))
                                .foregroundStyle(.mainText)
                            
                            TextField("슈나우저", text: Binding(
                                get: { breed ?? "" },
                                set: { breed = $0 }
                            ))
                            .frame(width: geo.size.width * 0.6)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 20)
                            .font(.notoSansRegular(size: 17))
                            .foregroundStyle(.category)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.sandBeige, lineWidth: 2)
                            }
                        }
                        
                        HStack(spacing: 12) {
                            Text("무게")
                                .frame(width: geo.size.width * 0.2, alignment: .leading)
                                .font(.notoSansMedium(size: 17))
                                .foregroundStyle(.mainText)
                            
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
                                .frame(width: geo.size.width * 0.6)
                                .padding(.vertical, 15)
                                .padding(.horizontal, 20)
                                .font(.notoSansRegular(size: 17))
                                .foregroundStyle(.category)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.sandBeige, lineWidth: 2)
                                }
                                
                                Text("kg")
                                    .font(.notoSansMedium(size: 17))
                                    .foregroundStyle(.subText)
                                    .padding(.trailing, 15)
                                    .padding(.bottom, 18)
                            }
                        }
                        
                        HStack(alignment: .top, spacing: 12) {
                            Text("소개글")
                                .frame(width: geo.size.width * 0.2, alignment: .leading)
                                .font(.notoSansMedium(size: 17))
                                .foregroundStyle(.mainText)
                            
                            TextEditor(text: Binding(
                                get: { desc ?? "" },
                                set: { desc = $0 }
                            ))
                            .frame(width: geo.size.width * 0.6, height: 100)
                            .font(.notoSansRegular(size: 17))
                            .scrollContentBackground(.hidden)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 20)
                            .background(Color.white)
                            .foregroundStyle(.category)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.sandBeige, lineWidth: 2)
                            }
                        }
                        
                        TagSelectionView()
                            .padding(.horizontal, -8)
                    }
                    .padding(.top, 35)
                    .frame(width: geo.size.width)
                }
                VStack {
                    Button {
                        isModal = false
                    } label: {
                        Text("확인")
                            .inputButtonStyle()
                    }
                }
                .padding(.bottom)
                
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}
