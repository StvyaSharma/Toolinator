//
//  File.swift
//  
//
//  Created by Stvya Sharma on 31/12/22.
//

import SwiftUI

struct NotesContentView: View {
    @StateObject var notes = Notes()
    @State private var showingInfo  = false
    @State private var sheetIsShowing = false
    @StateObject var globalString = GlobalString()

    var body: some View {
        
            VStack {
                NoteView()
                    .sheet(isPresented: $sheetIsShowing) {
                        EditNoteView()
                    }.sheet(isPresented: $showingInfo, content: {
                        InfoView(name:"Notes")})
            }.background{
                RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width:2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                    .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
            }.scrollContentBackground(.hidden)
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingInfo.toggle()
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            self.sheetIsShowing.toggle()
                        }
                    } label: {
                        Label("Add Note", systemImage: "plus.circle.fill")
                    }
                }
            }

        .environmentObject(notes)
        Text("").background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width:2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden)

    }
    
}

struct NotesContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotesContentView()
    }
}
