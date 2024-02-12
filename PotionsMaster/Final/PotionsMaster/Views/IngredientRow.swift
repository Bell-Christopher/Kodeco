//
//  IngredientRow.swift
//  PotionsMaster
//
//  Created by Christopher Bell on 11/02/2024.
//

import RealmSwift
import SwiftUI

struct IngredientRow: View {
    
    @State private var ingredientFormIsPresented = false
    
    @ObservedRealmObject var ingredient: Ingredient
    
    var buttonImage: String {
        ingredient.bought ? "circle.inset.filled" : "circle"
    }
    
    var body: some View {
        
        HStack {
            
            Button(action: openUpdateIngredient) {
                Text("\(ingredient.quantity)")
                    .bold()
                    .padding(.horizontal, 4)
                
                VStack(alignment: .leading) {
                    Text(ingredient.title)
                        .font(.headline)
                    Text(ingredient.notes)
                        .font(.subheadline)
                }
                .lineLimit(1)
            }
            .buttonStyle(PlainButtonStyle())
            .disabled(ingredient.bought)
            .sheet(isPresented: $ingredientFormIsPresented) {
                IngredientFormView(ingredient: ingredient)
            }
            
            Spacer()
            
            Button(action: toggleBought) {
                Image(systemName: buttonImage)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(ingredient.color)
            }
        }
    }
}

// MARK: - Actions
extension IngredientRow {
    
    func openUpdateIngredient() {
        //ingredientFormIsPresented.toggle()
    }
    
    func toggleBought() {
        
        $ingredient.bought.wrappedValue.toggle()
    }
}

// MARK: - Previews

#Preview {
    IngredientRow(ingredient: IngredientMock.ingredientsMock[0])
        .previewLayout(.sizeThatFits)
}

#Preview {
    IngredientRow(ingredient: IngredientMock.boughtIngredientsMock[0])
        .previewLayout(.sizeThatFits)
}
