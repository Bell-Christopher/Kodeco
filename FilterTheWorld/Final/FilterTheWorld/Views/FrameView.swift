//
//  FrameView.swift
//  FilterTheWorld
//
//  Created by Christopher Bell on 14/02/2024.
//

import SwiftUI

struct FrameView: View {
    
    var image: CGImage?
    private let label = Text("Camera Feed")
    
    var body: some View {
        
        if let image = image {
            GeometryReader { geometry in
                Image(image,
                      scale: 1.0,
                      orientation: .upMirrored,
                      label: label)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width,
                       height: geometry.size.height,
                       alignment: .center)
                .clipped()
            }
        } else {
            Color.black
        }
    }
}

#Preview {
    FrameView()
}
