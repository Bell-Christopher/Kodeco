//
//  IngredientFormView.swift
//  PotionsMaster
//
//  Created by Christopher Bell on 11/02/2024.
//

import SwiftUI

struct IngredientFormView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var ingredient: Ingredient
    
    let quantityOptions = [1, 2, 3, 4, 5]
    
    var isUpdating: Bool {
        // TODO: Mark as updating
        return false
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
                // TODO: Add Color Picker
                
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
        // TODO: Save ingredient
        
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
