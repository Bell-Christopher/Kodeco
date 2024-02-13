//
//  ThoughtView.swift
//  DailyThoughts
//
//  Created by Christopher Bell on 13/02/2024.
//

import SwiftUI

struct ThoughtView: View {
    
    let text: String
    
    var body: some View {
        
        Text(text)
            .padding(.horizontal)
            .padding(.vertical, 30)
            .frame(maxWidth: .infinity, minHeight: 150, alignment: .leading)
            .foregroundStyle(Color.black)
            .background(RoundedRectangle(cornerRadius: 25,
                                         style: .continuous))
            .foregroundStyle(Color.white)
    }
}


#Preview {
    ThoughtView(text: "This is a thought")
        .previewLayout(.sizeThatFits)
        .background(Color.mint)
}

