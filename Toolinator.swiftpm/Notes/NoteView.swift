//
//  File.swift
//  
//
//  Created by Stvya Sharma on 31/12/22.
//

import SwiftUI

struct NoteView: View {
    @EnvironmentObject var notes: Notes
    @StateObject var globalString = GlobalString()
    
    var body: some View {
        List {
            ForEach(notes.notes) { note in
                VStack(alignment: .leading) {
                    Text(note.title)
                        .foregroundColor(Color(uiColor: UIColor.tintColor))
                        .font(.headline)
                    Text(note.content)
                        .font(.body)
                        .padding(.vertical)
                
                   
                }
            }
            .onDelete(perform: deleteNote).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
        }.background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width:2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden)
    }
    
    func deleteNote(at offsets: IndexSet) {
        notes.notes.remove(atOffsets: offsets)
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
            .environmentObject(Notes())
    }
}

