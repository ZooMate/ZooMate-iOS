//
//  MyPetAddProfileView1.swift
//  ZooMate
//
//  Created by 최준영 on 5/27/25.
//

import SwiftUI

struct MyPetAddProfileView1: View {
    
    @State var petName: String = ""
    @State var age: String = ""
    @State var gender: Gender = .male
    @State var isNeutering: Bool = false
    @State var isPublic: Bool = true
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
                            Text("이름 *")
                                .frame(width: geo.size.width * 0.2, alignment: .leading)
                                .font(.notoSansMedium(size: 17))
                                .foregroundStyle(.mainText)
                            
                            TextField("반려동물의 이름", text: $petName)
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
                            Text("나이 *")
                                .frame(width: geo.size.width * 0.2, alignment: .leading)
                                .font(.notoSansMedium(size: 17))
                                .foregroundStyle(.mainText)
                            
                            TextField("반려동물의 나이", text: $age)
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
                            Text("성별 *")
                                .frame(width: geo.size.width * 0.2, alignment: .leading)
                                .font(.notoSansMedium(size: 17))
                                .foregroundStyle(.mainText)
                            
                            HStack(spacing: 8) {
                                Button {
                                    gender = .female
                                } label: {
                                    Text("여자")
                                        .padding(15)
                                }
                                .frame(width: geo.size.width * 0.34)
                                .font(.notoSansRegular(size: 17))
                                .foregroundStyle(.category)
                                .background(gender == .female ? .sandBeige : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.sandBeige, lineWidth: 2)
                                }
                                
                                Button {
                                    gender = .male
                                } label: {
                                    Text("남자")
                                        .padding(15)
                                }
                                .frame(width: geo.size.width * 0.34)
                                .font(.notoSansRegular(size: 17))
                                .foregroundStyle(.category)
                                .background(gender == .male ? .sandBeige : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.sandBeige, lineWidth: 2)
                                }
                            }
                        }
                        .padding(.top, 2)
                        
                        HStack(spacing: 12) {
                            Text("중성화 *")
                                .frame(width: geo.size.width * 0.2, alignment: .leading)
                                .font(.notoSansMedium(size: 17))
                                .foregroundStyle(.mainText)
                            
                            HStack(spacing: 8) {
                                Button {
                                    isNeutering = true
                                } label: {
                                    Text("O")
                                        .padding(15)
                                }
                                .frame(width: geo.size.width * 0.34)
                                .font(.notoSansRegular(size: 17))
                                .foregroundStyle(.category)
                                .background(isNeutering == true ? .sandBeige : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.sandBeige, lineWidth: 2)
                                }
                                
                                Button {
                                    isNeutering = false
                                } label: {
                                    Text("X")
                                        .padding(15)
                                }
                                .frame(width: geo.size.width * 0.34)
                                .font(.notoSansRegular(size: 17))
                                .foregroundStyle(.category)
                                .background(isNeutering == false ? .sandBeige : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.sandBeige, lineWidth: 2)
                                }
                            }
                        }
                        .padding(.top, 2)
                        
                        HStack(spacing: 12) {
                            Text("프로필 *\n공개여부")
                                .frame(width: geo.size.width * 0.2, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true) // 여러 줄도 보이게끔
                                .font(.notoSansMedium(size: 17))
                                .foregroundStyle(.mainText)
                            
                            HStack(spacing: 8) {
                                Button {
                                    isPublic = true
                                } label: {
                                    Text("공개")
                                        .padding()
                                }
                                .frame(width: geo.size.width * 0.34)
                                .font(.notoSansRegular(size: 17))
                                .foregroundStyle(.category)
                                .background(isPublic == true ? .sandBeige : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.sandBeige, lineWidth: 2)
                                }
                                
                                Button {
                                    isPublic = false
                                } label: {
                                    Text("비공개")
                                        .padding(15)
                                }
                                .frame(width: geo.size.width * 0.34)
                                .font(.notoSansRegular(size: 17))
                                .foregroundStyle(.category)
                                .background(isPublic == false ? .sandBeige : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.sandBeige, lineWidth: 2)
                                }
                            }
                        }
                        .padding(.top, 2)
                    }
                    .padding(35)
                    .frame(width: geo.size.width)
                    
                    
                }
                Spacer()
                
                VStack {
                    if petName.isEmpty || age.isEmpty {
                        Text("다음")
                            .nextBtnStyle()
                    } else {
                        NavigationLink(destination: MyPetAddProfileView2(isModal: $isModal)) {
                            Text("다음")
                                .inputButtonStyle()
                        }
                    }
                }
                .padding(.bottom)
            }
        }
    }
}
