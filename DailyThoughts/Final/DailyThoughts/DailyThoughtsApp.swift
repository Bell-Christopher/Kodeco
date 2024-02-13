//
//  DailyThoughtsApp.swift
//  DailyThoughts
//
//  Created by Christopher Bell on 13/02/2024.
//

import SwiftUI
import Firebase
import FirebaseDatabaseInternal

@main
struct DailyThoughtsApp: App {
    
    init() {
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthenticationModel())
                .environment(\.colorScheme, .light)
        }
    }
}
