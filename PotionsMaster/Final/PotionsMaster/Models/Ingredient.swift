//
//  Ingredient.swift
//  PotionsMaster
//
//  Created by Christopher Bell on 11/02/2024.
//

import RealmSwift
import SwiftUI

class Ingredient: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var notes = ""
    @Persisted var quantity = 1
    @Persisted var bought = false
    @Persisted var colorOption = ColorOptions.green
}

extension Ingredient {
    
    var color: Color {
        colorOption.color
    }
}
