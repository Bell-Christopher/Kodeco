//
//  ContentView.swift
//  PotionsMaster
//
//  Created by Christopher Bell on 11/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationStack {
            
            IngredientListView()
        }
    }
}

#Preview {
    ContentView()
}
