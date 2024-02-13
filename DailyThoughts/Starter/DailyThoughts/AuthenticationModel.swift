//
//  AuthenticationModel.swift
//  DailyThoughts
//
//  Created by Christopher Bell on 13/02/2024.
//

import SwiftUI
import FirebaseAuth

final class AuthenticationModel: ObservableObject {
    
    var user: User? {
        didSet {
            objectWillChange.send()
        }
    }
    
    func listenToAuthState() {
        
    }
    
    func signUp(emailAddress: String, password: String) {
        
    }
    
    func signIn(emailAddress: String, password: String) {
        
    }
    
    func signOut() {
        
    }
}
