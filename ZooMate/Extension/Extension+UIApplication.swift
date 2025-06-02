//
//  Extension+UIApplication.swift
//  ZooMate
//
//  Created by Song Kim on 6/2/25.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
