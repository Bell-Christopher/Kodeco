//
//  IngredientFormView.swift
//  PotionsMaster
//
//  Created by Christopher Bell on 11/02/2024.
//

import RealmSwift
import SwiftUI

struct IngredientFormView: View {
    
    @Environment(\.realm) var realm
    @Environment(\.dismiss) var dismiss
    
    @ObservedRealmObject var ingredient: Ingredient
    
    let quantityOptions = [1, 2, 3, 4, 5]
    let colorOptions = ColorOptions.allCases
    
    var isUpdating: Bool {
        ingredient.realm != nil
    }
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                TextField("Title", text: $ingredient.title)
                Picker("Quantity", selection: $ingredient.quantity) {
                    ForEach(quantityOptions, id: \.self) { option in
                        Text("\(option)")
                    }
                }
                
                Picker("Color", selection: $ingredient.colorOption) {
                    ForEach(colorOptions, id: \.self) { option in
                        Text(option.title)
                    }
                }
                
                Section("Notes📝") {
                    TextEditor(text: $ingredient.notes)
                }
            }
            .navigationTitle("Ingredient Form")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(isUpdating ? "Done" : "Save") {
                        if isUpdating {
                            dismiss()
                        }
                        else {
                            save()
                        }
                    }
                    .disabled(ingredient.title.isEmpty)
                }
            }
        }
    }
}

// MARK: - Actions
extension IngredientFormView {
    
    func save() {
        
        try? realm.write {
            realm.add(ingredient)
        }
        
        dismiss()
    }
}

// MARK: - Previews

#Preview {
    IngredientFormView(ingredient: Ingredient())
}

#Preview {
    IngredientFormView(ingredient: IngredientMock.ingredientsMock[0])
}
