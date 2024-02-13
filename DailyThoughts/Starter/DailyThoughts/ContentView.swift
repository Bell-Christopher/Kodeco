//
//  ContentView.swift
//  DailyThoughts
//
//  Created by Christopher Bell on 13/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var authModel: AuthenticationModel
    
    var body: some View {
        
        Group {
            if authModel.user == nil {
                SignUpView()
            }
            else {
                JournalListView()
            }
        }
        .onAppear {
            authModel.listenToAuthState()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthenticationModel())
}
