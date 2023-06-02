//
//  File.swift
//  
//
//  Created by Stvya Sharma on 18/01/23.
//

import SwiftUI

struct ScoresContentView: View {
    @ObservedObject var model: ViewModel

    @State private var showingClearAlert = false
    @StateObject var globalString = GlobalString()
    @State private var showingInfo  = false

    var body: some View {
        List {
            ForEach($model.items, content: ScoreRow.init)
                .onDelete(perform: model.delete).listRowBackground(Color(UIColor.white).opacity(0))

            Button(action: model.add) {
                Label("Add Player", systemImage: "plus").foregroundColor(Color.accentColor)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .contentShape(Rectangle())
            }.listRowBackground(Color(UIColor.white).opacity(0))
            
            .listRowSeparator(.hidden)
        }.sheet(isPresented: $showingInfo, content: {
            InfoView(name: "Game Score Tracker")})
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: model.reset) {
                    Label("Reset Scores to 0", systemImage: "arrow.counterclockwise").foregroundColor(Color.accentColor)
                }
                .disabled(model.items.isEmpty)
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                
                HStack{
                    
                    
                    Button(action: {
                        showingInfo.toggle()
                    }, label: {
                        Image(systemName: "info.circle").foregroundColor(Color.accentColor)
                    })
                    Spacer()
                    Spacer()
                    Button {
                        showingClearAlert = true
                    } label: {
                        Label("Remove All", systemImage: "trash").foregroundColor(Color.accentColor)
                    }
                    .disabled(model.items.isEmpty)
                    
                    
                }
                
    
                
            }
        }
        .alert("Delete all players?", isPresented: $showingClearAlert) {
            Button("Delete", role: .destructive, action: model.deleteAll)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This will immediately delete all players and their scores.")
        }
        .animation(.default, value: model.items)
        .navigationTitle("Game Score Tracker")
        .background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden)
        .buttonStyle(.plain)
    }
}

struct ScoresContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresContentView(model: ViewModel())
    }
}

