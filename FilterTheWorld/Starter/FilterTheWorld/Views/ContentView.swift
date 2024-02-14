//
//  ContentView.swift
//  FilterTheWorld
//
//  Created by Christopher Bell on 14/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea(edges: .all)
            
            Text("Filter the World!")
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    ContentView()
}
