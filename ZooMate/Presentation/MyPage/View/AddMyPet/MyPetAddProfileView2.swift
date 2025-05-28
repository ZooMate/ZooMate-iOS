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
    @State var tag: [String] = []
    
    var body: some View {
        //NavigationView {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("프로필을 입력해주세요")
                    .font(.notoSansBold(size: 30))
                    .padding(.horizontal)
                GeometryReader { geo in
                    VStack {
                        HStack(spacing: 12) {
                            Text("품종")
                                .frame(width: geo.size.width * 0.2, alignment: .leading)
                                .font(.notoSansMedium(size: 17))
                                .foregroundStyle(.mainText)
                            
                            TextField("ex) 슈나우저", text: Binding(
                                get: { breed ?? "" },
                                set: { breed = $0 }
                            ))
                            .frame(width: geo.size.width * 0.6)
                            .padding(20)
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
                            
                            TextField("ex) 3.5", text: Binding(
                                get: { weight ?? "" },
                                set: { weight = $0 }
                            ))
                            .keyboardType(.decimalPad)
                            .frame(width: geo.size.width * 0.6)
                            .padding(20)
                            .font(.notoSansRegular(size: 17))
                            .foregroundStyle(.category)
                            .background(.white)
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
                    NavigationLink(destination: MyPetListView()) {
                        Button {
                            
                        } label: {
                            Text("확인")
                        }
                        .inputButtonStyle()
                    }
                }
                .padding(.bottom)
                
            }
        }
        //}
    }
}

#Preview {
    MyPetAddProfileView2()
}
