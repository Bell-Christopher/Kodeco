//
//  DailyThoughtsApp.swift
//  DailyThoughts
//
//  Created by Christopher Bell on 13/02/2024.
//

import SwiftUI
import Firebase

@main
struct DailyThoughtsApp: App {
    
    init() {
        //FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthenticationModel())
                .environment(\.colorScheme, .light)
        }
    }
}
