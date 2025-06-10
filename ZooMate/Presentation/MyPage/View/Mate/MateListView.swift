//
//  MateListView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct MateListView: View {
    @ObservedObject var myData: MyData
    @Binding var matePetList: [PetList]
    
    var body: some View {
        if myData.myInfo == nil {
            LoginPromptView()
        } else {
            MateView(myData: myData, matePetList: $matePetList)
                .toolbar(.hidden, for: .tabBar)
        }
    }
}
