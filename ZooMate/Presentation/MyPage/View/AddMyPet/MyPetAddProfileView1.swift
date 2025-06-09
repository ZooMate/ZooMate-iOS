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
    @Binding var isModal: Bool
    @Binding var addPet: AddPetRequest
    
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
                    let buttonWidth = geo.size.width * 0.34
                    
                    VStack {
                        HStack(alignment: .firstTextBaseline, spacing: 12) {
                            Text("이름 *")
                                .formLabelStyle(width: labelWidth)
                            
                            TextField("반려동물의 이름", text: $petName)
                                .sandTextFieldStyle(width: fieldWidth)
                                .onChange(of: petName) {
                                    addPet.petName = petName
                                }
                        }
                        
                        HStack(alignment: .firstTextBaseline, spacing: 12) {
                            Text("나이 *")
                                .formLabelStyle(width: labelWidth)
                            
                            TextField("반려동물의 나이", text: $age)
                                .sandTextFieldStyle(width: fieldWidth)
                                .keyboardType(.numberPad)
                                .onChange(of: age) {
                                    age = age.filter{ $0.isNumber }
                                    addPet.age = Int(age) ?? 0
                                }
                        }
                        
                        HStack(alignment: .firstTextBaseline, spacing: 12) {
                            Text("성별 *")
                                .formLabelStyle(width: labelWidth)
                            
                            HStack(spacing: 8) {
                                Button {
                                    addPet.gender = "female"
                                } label: {
                                    Text("여자")
                                        .padding(15)
                                }
                                .sandButtonStyle(isSelected: addPet.gender == "female", width: buttonWidth)
                                
                                Button {
                                    addPet.gender = "male"
                                } label: {
                                    Text("남자")
                                        .padding(15)
                                }
                                .sandButtonStyle(isSelected: addPet.gender == "male", width: buttonWidth)
                            }
                        }
                        .padding(.top, 2)
                        
                        HStack(alignment: .firstTextBaseline, spacing: 12) {
                            Text("중성화 *")
                                .formLabelStyle(width: labelWidth)
                            
                            HStack(spacing: 8) {
                                Button {
                                    addPet.isNeutering = true
                                } label: {
                                    Text("O")
                                        .padding(15)
                                }
                                .sandButtonStyle(isSelected: addPet.isNeutering == true, width: buttonWidth)
                                
                                Button {
                                    addPet.isNeutering = false
                                } label: {
                                    Text("X")
                                        .padding(15)
                                }
                                .sandButtonStyle(isSelected: addPet.isNeutering == false, width: buttonWidth)
                            }
                        }
                        .padding(.top, 2)
                        
                        HStack(spacing: 12) {
                            Text("프로필 *\n공개여부")
                                .formLabelStyle(width: labelWidth)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            HStack(spacing: 8) {
                                Button {
                                    addPet.isPublic = true
                                } label: {
                                    Text("공개")
                                        .padding()
                                }
                                .sandButtonStyle(isSelected: addPet.isPublic == true, width: buttonWidth)
                                
                                Button {
                                    addPet.isPublic = false
                                } label: {
                                    Text("비공개")
                                        .padding(15)
                                }
                                .sandButtonStyle(isSelected: addPet.isPublic == false, width: buttonWidth)
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
                            .grayButtonStyle()
                    } else {
                        NavigationLink(destination: MyPetAddProfileView2(isModal: $isModal, addPet: $addPet)) {
                            Text("다음")
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
