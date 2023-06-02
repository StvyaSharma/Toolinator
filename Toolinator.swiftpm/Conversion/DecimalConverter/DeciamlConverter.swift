//
//  File.swift
//  
//
//  Created by Stvya Sharma on 29/12/22.
//

import SwiftUI
import  IrregularGradient

struct DecimalConverterView: View {
   var basevalues = basecal()

    
    @State var sliderValue : Float = 2.0
    @State var input = ""
    @State var output = ""
    @State private var showingInfo  = false
    @StateObject var globalString = GlobalString()
   
    
    var body: some View {
        Form {
            Section {
                Text("Select units").listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                    .font(.headline)
                
                Slider(value: $sliderValue, in: 2...36,
                       step: 1){
                    Text("Slider")
                } minimumValueLabel: {
                    Text("2").font(.headline).fontWeight(.bold)
                } maximumValueLabel: {
                    Text("36").font(.headline).fontWeight(.bold)
                }
                    .listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                        .font(.headline)
                Text("Base \(Int(sliderValue))").listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                    .font(.headline)
                
            }
            
            Section {
                Text("Value")
                    .font(.headline).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                TextField("Enter", text: $input)
                    .keyboardType(.decimalPad).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
            }
            Section {
                Text("Result")
                    .font(.headline).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                Text("\(String(Int(input) ?? 0, radix: Int(sliderValue) ))").listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
            }
        }
        .sheet(isPresented: $showingInfo, content: {
            InfoView(name: "Decimal Converter")}).background{
                RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                    .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
                }.scrollContentBackground(.hidden)
            .navigationTitle("Decimal Converter")
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

struct DecimalConverterView_Previews: PreviewProvider {
    static var previews: some View {
        DecimalConverterView()
    }
}


func basecal() -> [Int] {
    var basevale = [2]
    for i in 3...36 {
        basevale.append(i)
    }
    return basevale
}
