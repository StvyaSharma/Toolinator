//
//  File.swift
//  
//
//  Created by Stvya Sharma on 31/12/22.
//

import SwiftUI

struct EditNoteView: View {
    @State private var title = ""
    @State private var content = ""
    @State private var placeholderText = "Enter Text Here"
    @EnvironmentObject var notes: Notes
    @Environment(\.dismiss) var dismiss
    @StateObject var globalString = GlobalString()
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                ZStack {
                    ZStack{
                        if content.isEmpty {
                            TextEditor(text:$placeholderText)
                                            .foregroundColor(.gray)
                                            .frame(height: 0.7*UIScreen.screenHeight)
                        }
                        TextEditor(text: $content)
                            .frame(height: 0.7*UIScreen.screenHeight)
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Count: \(content.count)")
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                }
                HStack {
                    Spacer()
                    Button("Add note!") {
                        notes.addNote(title: title, content: content)
                        dismiss()
                    }
                    Spacer()
                }
            }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
        }.background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden)
    }
}

struct EditNoteView_Previews: PreviewProvider {
    static var previews: some View {
        EditNoteView()
            .environmentObject(Notes())
    }
}

