//
//  File.swift
//  
//
//  Created by Stvya Sharma on 31/12/22.
//

import Foundation
import SwiftUI

struct Note : Codable, Identifiable {
    let id = UUID()
    var title: String
    var content: String
    
}

@MainActor class Notes : ObservableObject {
    private let NOTES_KEY = "NotesKey"
    var notes: [Note] {
        didSet {
            saveData()
            objectWillChange.send()
        }
    }
    
    init() {
        // Load saved data
        if let data = UserDefaults.standard.data(forKey: NOTES_KEY) {
            if let decodedNotes = try? JSONDecoder().decode([Note].self, from: data) {
                notes = decodedNotes
                return
            }
        }
        // Tutorial Note
        notes = []
    }
    
    func addNote(title: String, content: String) {
        let tempNote = Note(title: title, content: content)
        notes.insert(tempNote, at: 0)
        saveData()
    }
    
    // Save data
    private func saveData() {
        if let encodedNotes = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encodedNotes, forKey: NOTES_KEY)
        }
    }
}

