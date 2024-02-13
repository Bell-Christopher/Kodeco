//
//  JournalModelController.swift
//  DailyThoughts
//
//  Created by Christopher Bell on 13/02/2024.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

final class JournalModelController: ObservableObject {
    
    @Published var thoughts: [ThoughtModel] = []
    @Published var newThoughtText: String = ""
    
    private lazy var databasePath: DatabaseReference? = {
        guard let uid = Auth.auth().currentUser?.uid else {
            return nil
        }
        
        let ref = Database.database()
            .reference()
            .child("users/\(uid)/thoughts")
        
        return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func listenForThoughts() {
        
        guard let databasePath = databasePath else {
            return
        }
        
        databasePath.observe(.childAdded) { [weak self] snapshot in
            guard
                let self = self,
                var json = snapshot.value as? [String: Any]
            else {
                return
            }
            
            json["id"] = snapshot.key
            
            do {
                let thoughtData = try JSONSerialization.data(withJSONObject: json)
                let thought = try self.decoder.decode(ThoughtModel.self, from: thoughtData)
                self.thoughts.append(thought)
            } catch {
                print("an error occurred", error)
            }
        }
    }
    
    func stopListening() {
        
        databasePath?.removeAllObservers()
    }
    
    func postThought() {
        
        guard let databasePath = databasePath else {
            return
        }
        
        if newThoughtText.isEmpty {
            return
        }
        
        let thought = ThoughtModel(text: newThoughtText)
        
        do {
            let data = try encoder.encode(thought)
            let json = try JSONSerialization.jsonObject(with: data)
            
            databasePath.childByAutoId()
                .setValue(json)
        } catch {
            print("an error occurred", error)
        }
    }
}
