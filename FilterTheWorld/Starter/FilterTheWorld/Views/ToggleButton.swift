//
//  ToggleButton.swift
//  FilterTheWorld
//
//  Created by Christopher Bell on 14/02/2024.
//

import SwiftUI

struct ToggleButton: View {
    
    @Binding var selected: Bool
    var label: String
    
    var body: some View {
        
        Button(action: {
            selected.toggle()
        }, label: {
            Text(label)
        })
        .padding(.vertical, 10)
        .padding(.horizontal)
        .foregroundStyle(selected ? Color.white : Color.black)
        .background(selected ? Color.blue : Color.white)
        .animation(.easeInOut, value: 0.25)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    
    ZStack {
        Color.black
        ToggleButton(selected: .constant(false), label: "Toggle")
    }
}
