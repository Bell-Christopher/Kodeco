//
//  Ingredient.swift
//  PotionsMaster
//
//  Created by Christopher Bell on 11/02/2024.
//

import SwiftUI

class Ingredient: ObservableObject, Identifiable {
    
    let id = UUID()
    @Published var title = ""
    @Published var notes = ""
    @Published var quantity = 1
    @Published var bought = false
}
