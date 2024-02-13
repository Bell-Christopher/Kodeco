//
//  JournalModelController.swift
//  DailyThoughts
//
//  Created by Christopher Bell on 13/02/2024.
//

import SwiftUI

final class JournalModelController: ObservableObject {
    
    @Published var thoughts: [ThoughtModel] = []
    @Published var newThoughtText: String = ""
    
    func listenForThoughts() {
        
    }
    
    func stopListening() {
        
    }
    
    func postThought() {
        
    }
}
