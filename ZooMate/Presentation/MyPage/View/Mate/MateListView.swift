//
//  MateListView.swift
//  ZooMate
//
//  Created by 최준영 on 5/26/25.
//

import SwiftUI

struct MateListView: View {
    @ObservedObject var myData: MyData
    
    var body: some View {
        if myData.myInfo == nil {
            LoginPromptView()
        } else {
            MateView(data: DummyData1())
                .toolbar(.hidden, for: .tabBar)
        }
    }
}
