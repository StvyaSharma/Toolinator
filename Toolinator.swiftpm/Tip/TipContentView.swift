//
//  File.swift
//  
//
//  Created by Stvya Sharma on 18/01/23.
//

import SwiftUI

struct TipContentView: View {
    @StateObject var globalString = GlobalString()
    
    @State private var billAmount = ""
    @State private var tipPercentage = 1
    @State private var splitNumber = 0
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(splitNumber + 2)
        let tipSelection = Double(self.tipPercentages[tipPercentage])
        let bill = Double(billAmount) ?? 0
        
        let billWithTip = bill + ((bill/100) * tipSelection)
        return billWithTip / peopleCount
    }
    
    
    var body: some View {

            Form {
                Section {
                    TextField("Amount", text: $billAmount)
                        .keyboardType(.decimalPad)
                    Picker("Ways to split", selection: $splitNumber) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                
                Section(header: Text("How much tip would you like to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.colorMultiply(Color(uiColor: UIColor.systemBackground).opacity(0.85))
                    .pickerStyle(SegmentedPickerStyle())
                }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                
                Section {
                    Text("Total Bill: $\(billAmount)")
                    Text("Total Bill + Tip: $\(self.totalPerPerson*Double(self.splitNumber + 2), specifier: "%.2f")")
                    Text("Bill per person: $\(self.totalPerPerson, specifier: "%.2f")")
                }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
            }.background{
                RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width:2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                    .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
            }.scrollContentBackground(.hidden)
            .navigationBarTitle("Split & Tip")
        
    }
}

struct TipContentView_Previews: PreviewProvider {
    static var previews: some View {
        TipContentView()
    }
}

