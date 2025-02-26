//
//  Priority.swift
//  Reminders_Observable
//
//  Created by Charles Michael on 2/26/25.
//

import Foundation

enum Priority: String, CaseIterable, CustomStringConvertible {
    case none
    case low
    case medium
    case high
    
    var description: String {
        self.rawValue.capitalized
    }
    
    var shortDescription: String {
        switch self {
        case .none: ""
        case .low: "!"
        case .medium: "!!"
        case .high: "!!!"
        }
    }
    
    static let allDescriptions = Self.allCases.map { $0.description}
}




