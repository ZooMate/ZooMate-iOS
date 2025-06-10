//
//  Dateformatter.swift
//  ZooMate
//
//  Created by Song Kim on 5/27/25.
//

import Foundation

struct DateFormatterManager {
    
    // MARK: - ISO String → Date
    static let isoFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter
    }()
    
    // MARK: - Date → 시간 문자열 (ex: "오후 02:15")
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "a hh:mm"
        return formatter
    }()
    
    // MARK: - Helper: String → String
    static func formattedTime(from isoDateString: String) -> String? {
        guard let date = isoFormatter.date(from: isoDateString) else {
            return nil
        }
        return timeFormatter.string(from: date)
    }
}
