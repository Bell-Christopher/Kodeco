//
//  CompositionView.swift
//  DailyThoughts
//
//  Created by Christopher Bell on 13/02/2024.
//

import SwiftUI
import UIKit

struct CompositionView: View {
    
    @ObservedObject var modelController = JournalModelController()
    @Binding var thoughtText: String
    @Environment(\.dismiss) var dismiss
    
    init(thoughtText: Binding<String>,
         modelController: JournalModelController) {
        self._thoughtText = thoughtText
        self.modelController = modelController
        //UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            postButton()
            textView()
        }
    }
    
    @ViewBuilder
    private func postButton() -> some View {
        
        HStack {
            Spacer()
            Button(action: {
                modelController.postThought()
                thoughtText = ""
                dismiss()
            }, label: {
                Text("Post")
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background(Capsule()
                        .foregroundStyle(Color.mint))
            })
            .padding(.trailing)
        }
    }
    
    @ViewBuilder
    private func textView() -> some View {
        
        ZStack(alignment: .topLeading) {
            if thoughtText.isEmpty {
                Text("What's on your mind?")
                    .padding(.horizontal, 8)
                    .padding(.top, 8)
                    .foregroundStyle(Color.gray)
            }
            
            TextEditor(text: $thoughtText)
                .padding(.horizontal, 4)
                .background(Color.clear)
                .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    CompositionView(
        thoughtText: .constant(""),
        modelController: JournalModelController()
    )
}
