//
//  File.swift
//  
//
//  Created by Stvya Sharma on 29/12/22.
//

import SwiftUI

struct ASCIIConverterView: View {
    @State private var Numeral = ""
    @State private var showingInfo  = false
    @StateObject var globalString = GlobalString()

    var result:  String  {
        
        let num = Numeral.asciiValues
        let stringArray = num.map { String($0) }
        return stringArray.joined(separator:"-")
    }

    var body: some View {
        Form {
            Section {
                Text("Enter Text").listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                    .font(.headline)
                TextField("Text", text: $Numeral)
                    .keyboardType(/*@START_MENU_TOKEN@*/.alphabet/*@END_MENU_TOKEN@*/).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
            }

            Section {
                Text("ASCII Code").listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                    .font(.headline)
                Text("\(result)").listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
            }
        }.sheet(isPresented: $showingInfo, content: {
            InfoView(name: "ASCII Converter")}).background{
                
                
                RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                    .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
                }.scrollContentBackground(.hidden)
                .navigationTitle("ASCII Converter")
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

struct ASCIIConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ASCIIConverterView()
    }
}
extension StringProtocol {
    var asciiValues: [UInt8] { compactMap(\.asciiValue) }
}

