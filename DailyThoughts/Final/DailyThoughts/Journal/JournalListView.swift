//
//  JournalListView.swift
//  DailyThoughts
//
//  Created by Christopher Bell on 13/02/2024.
//

import SwiftUI

struct JournalListView: View {
    
    @StateObject var modelController = JournalModelController()
    @State private var showingCompositionView = false
    @EnvironmentObject var authModel: AuthenticationModel
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                List(modelController.thoughts) { thought in
                    ThoughtView(text: thought.text)
                }
                composeButton()
            }
            .navigationTitle("Daily Thoughts")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                signOutButton()
            }
            .onAppear {
                modelController.listenForThoughts()
            }
            .onDisappear {
                modelController.stopListening()
            }
        }
        .animation(.none, value: 0)
    }
    
    @ViewBuilder
    private func composeButton() -> some View {
        
        VStack(spacing: 0) {
            Spacer()
            HStack(spacing: 0) {
                Spacer()
                Button(action: {
                    showingCompositionView = true
                }, label: {
                    Image(systemName: "plus")
                        .resizable()
                        .padding()
                        .frame(width: 50, height: 50)
                        .background(Color.mint)
                        .clipShape(Circle())
                        .foregroundStyle(Color.white)
                })
                .padding(30)
                .fullScreenCover(isPresented: $showingCompositionView) {
                    CompositionView(
                        thoughtText: $modelController.newThoughtText,
                        modelController: modelController
                    )
                }
            }
        }
    }
    
    @ViewBuilder
    private func signOutButton() -> some View {
        
        Button(action: {
            authModel.signOut()
        }, label: {
            Text("Sign Out")
                .bold()
                .font(.footnote)
                .foregroundStyle(Color.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Capsule().foregroundStyle(Color.mint))
        })
    }
}

#Preview {
    let modelController = JournalModelController()
    modelController.thoughts = [
        ThoughtModel(text: "Wow I love this app!")
    ]
    
    return NavigationStack {
        AnyView(JournalListView(modelController: modelController))
    }
    .previewLayout(.sizeThatFits)
}
