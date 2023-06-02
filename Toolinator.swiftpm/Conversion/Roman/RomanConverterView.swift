//
//  File.swift
//  
//
//  Created by Stvya Sharma on 28/12/22.
//

import SwiftUI

struct RomanConverterView: View {
    @State private var romanNumeral = ""
    @State private var showingInfo  = false
    @StateObject var globalString = GlobalString()

    var result: Int {
        return RomanNumeralsConverter.convert(string: romanNumeral) ?? 0
    }

    var body: some View {
        Form {
            Section {
                TextField("Roman Numeral", text: $romanNumeral)
                    .keyboardType(/*@START_MENU_TOKEN@*/.alphabet/*@END_MENU_TOKEN@*/).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
            }

            Section {
                Text("\(result)").listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
            }
        }.sheet(isPresented: $showingInfo, content: {
            InfoView(name: "Roman Number Convertor")}).background{
                
                
                RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                    .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
                }.scrollContentBackground(.hidden)
                .navigationTitle("Roman Number Convertor")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            hideKeyboard()
                        }, label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        })
                        Button(action: {
                            showingInfo = true
                        }, label: {
                            Image(systemName: "info.circle")
                        })
                    }
                }
    }
}

struct RomanConverterView_Previews: PreviewProvider {
    static var previews: some View {
        RomanConverterView()
    }
}
