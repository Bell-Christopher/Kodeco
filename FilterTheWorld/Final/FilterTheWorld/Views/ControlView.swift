//
//  ControlView.swift
//  FilterTheWorld
//
//  Created by Christopher Bell on 14/02/2024.
//

import SwiftUI

struct ControlView: View {
    
    @Binding var comicSelected: Bool
    @Binding var monoSelected: Bool
    @Binding var crystalSelected: Bool
    
    var body: some View {
        
        VStack {
            Spacer()
            
            HStack(spacing: 12) {
                ToggleButton(selected: $comicSelected, label: "Comic")
                ToggleButton(selected: $monoSelected, label: "Mono")
                ToggleButton(selected: $crystalSelected, label: "Crystal")
            }
        }
    }
}

#Preview {
    
    ZStack {
        Color.black
            .ignoresSafeArea(edges: .all)
        
        ControlView(
            comicSelected: .constant(false),
            monoSelected: .constant(true),
            crystalSelected: .constant(true)
        )
    }
}
