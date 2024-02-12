//
//  ColorOptions.swift
//  PotionsMaster
//
//  Created by Christopher Bell on 12/02/2024.
//

import SwiftUI
import RealmSwift

enum ColorOptions: String, CaseIterable, PersistableEnum {
    
    case green
    case lightBlue
    case lightRed
    
    var color: Color {
        Color(rawValue)
    }
    
    var title: String {
        
        switch self {
        case .green:
            return "Green"
        case .lightBlue:
            return "Light Blue"
        case .lightRed:
            return "Light Red"
        }
    }
}
