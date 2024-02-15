//
//  ContentView.swift
//  FilterTheWorld
//
//  Created by Christopher Bell on 14/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var model = ContentViewModel()
    
    var body: some View {
        
        ZStack {
            
            FrameView(image: model.frame)
                .ignoresSafeArea(edges: .all)
            
            ErrorView(error: model.error)
            
            ControlView(
                comicSelected: $model.comicFilter,
                monoSelected: $model.monoFilter,
                crystalSelected: $model.crystalFilter
            )
        }
    }
}

#Preview {
    ContentView()
}
