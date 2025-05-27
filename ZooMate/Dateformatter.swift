//
//  Dateformatter.swift
//  ZooMate
//
//  Created by Song Kim on 5/27/25.
//

import SwiftUI

var timeFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm" // 24시간 형식
    return formatter
}
