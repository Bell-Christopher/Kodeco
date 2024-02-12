//
//  IngredientListView.swift
//  PotionsMaster
//
//  Created by Christopher Bell on 12/02/2024.
//

import RealmSwift
import SwiftUI

struct IngredientListView: View {
    
    @State private var ingredientFormIsPresented = false
    
    @ObservedResults(
        Ingredient.self,
        where: { $0.bought == false }
    ) var ingredients
    
    @ObservedResults(
        Ingredient.self,
        where: { $0.bought == true }
    ) var boughtIngredients
    
    @ViewBuilder var newIngredientButton: some View {
        Button(action: openNewIngredient) {
            Label("New Ingredient", systemImage: "plus.circle.fill")
        }
        .foregroundStyle(Color.green)
        .sheet(isPresented: $ingredientFormIsPresented) {
            IngredientFormView(ingredient: Ingredient())
        }
    }
    
    var body: some View {
        
        List {
            
            Section("Ingredients") {
                if ingredients.isEmpty {
                    Text("Add some ingredients to the list 🥬")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                
                ForEach(ingredients) { ingredient in
                    IngredientRow(ingredient: ingredient)
                }
                
                newIngredientButton
            }
            
            Section {
                if boughtIngredients.isEmpty {
                    Text("Buy some ingredients to have them listed here.")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                
                ForEach(boughtIngredients) { ingredient in
                    IngredientRow(ingredient: ingredient)
                }
                .onDelete(perform: $boughtIngredients.remove)
            } header: {
                Text("Bought")
            } footer: {
                if !boughtIngredients.isEmpty {
                    Text("Swipe from right to left to delete an ingredient.")
                }
            }
        }
        .navigationTitle("Potions Master 🧪")
    }
}

// MARK: - Actions
extension IngredientListView {
    
    func openNewIngredient() {
        ingredientFormIsPresented.toggle()
    }
}

#Preview {
    IngredientListView()
}
