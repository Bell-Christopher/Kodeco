//
//  ErrorView.swift
//  FilterTheWorld
//
//  Created by Christopher Bell on 14/02/2024.
//

import SwiftUI

struct ErrorView: View {
    
    var error: Error?
    
    var body: some View {
        
        VStack {
            
            Text(error?.localizedDescription ?? "")
                .bold()
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(8)
                .foregroundStyle(Color.white)
                .background(Color.red.ignoresSafeArea(edges: .top))
                .opacity(error == nil ? 0.0 : 1.0)
                .animation(.easeInOut, value: 0.25)
            
            Spacer()
        }
    }
}

#Preview {
    ErrorView(error: CameraError.cannotAddInput)
}
