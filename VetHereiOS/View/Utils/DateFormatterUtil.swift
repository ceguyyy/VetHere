//
//  DateFormatter.swift
//  VetHereiOS
//
//  Created by Christian Gunawan on 30/10/24.
//
import Foundation

class DateFormatterUtil {
    static let shared: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}
