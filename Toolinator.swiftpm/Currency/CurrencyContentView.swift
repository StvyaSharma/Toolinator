//
//  File.swift
//  
//
//  Created by Stvya Sharma on 19/01/23.
//

import SwiftUI
import  IrregularGradient

struct CurrencyContentView: View {
    
    @StateObject var globalString = GlobalString()
    @State private var inCur = "USD"
    @State private var outCur = "AUD"
    @State private var showingInfo  = false
    
    let names = ["AFN", "ARS", "AMD", "AWG", "AUD", "AZN", "BSD", "BHD", "BBD", "BDT", "BMD", "BOB", "BAM", "BRL", "GBP", "BGN", "KHR", "CAD", "XAF", "CLP", "CNY", "COP", "XPF", "HRK", "CZK", "DKK", "DOP", "EGP", "AED", "EUR", "FJD", "GMD", "GEL", "GHS", "HKD", "HUF", "ISK", "IDR", "IRR", "IQD", "ILS", "JMD", "JPY", "JOD", "KZT", "KES", "KWD", "LAK", "LBP", "LYD", "MKD", "MYR", "MVR", "MUR", "MXN", "MDL", "MAD", "NAD", "NZD", "NGN", "NOK", "NOK", "OMR", "PKR", "PYG", "PEN", "PHP", "PLN", "QAR", "RON", "RUB", "SAR", "RSD", "SCR", "ZAR", "KRW", "LKR", "SEK", "CHF", "TWD", "THB", "TND", "TRY", "UGX", "UAH", "USD", "UYU", "VEF", "VND", "INR"]
    
    let cost = [ 0.95, 0.48, 0.21, 45.96, 55.55, 48.67, 82.46, 218.97, 40.86, 0.79, 82.73, 11.94, 44.84, 15.59, 100.47, 44.82, 0.020, 60.19, 0.13, 0.093, 11.86, 0.017, 0.73, 11.64, 3.61, 11.77, 1.49, 3.36, 22.53, 87.65, 37.50, 1.33, 31.22, 9.16, 10.63, 0.22, 0.58, 0.0053, 0.0020, 0.057, 23.89, 0.54, 0.61, 116.64, 0.18, 0.69, 269.14, 0.0048, 0.055, 17.11, 1.42, 18.70, 5.37, 1.87, 4.18, 4.28, 7.87, 5.56, 52.69, 0.19, 8.36, 8.36, 214.45, 0.37, 0.011, 21.52, 1.49, 18.69, 22.72, 17.82, 1.28, 22.01, 0.75, 6.33, 4.69, 0.063, 0.22, 7.95, 88.79, 2.69, 2.32, 26.21, 4.44, 0.023, 2.24, 82.73, 2.13, 0.0000543713, 0.0035, 1 ]
    
    func CurVal(input: String) -> Double {
        let indexOfCur = names.firstIndex(of: input)
        return cost[indexOfCur!]
    }
    
    
    @State private var inputVal: Double = 0
    
    
    var body: some View {
        Form {
            Section {
                Text("Select units").listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                    .font(.headline)
                
                Picker("From", selection: $inCur) {
                                ForEach(names, id: \.self) {
                                    Text($0)
                                }
                }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                    .font(.body)
                Picker("To", selection: $outCur) {
                                ForEach(names, id: \.self) {
                                    Text($0)
                                }
                            }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                    .font(.body)
           
            }
            
            Section {
                Text("Value")
                    .font(.headline).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                
                TextField("Enter", value: $inputVal, format: .number)
                    .keyboardType(.decimalPad).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                
            }
            Section(header: Text("These rates are on 18 Dec 2022")) {
                Text("Result")
                    .font(.headline).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                Text("\((CurVal(input: inCur) * inputVal)/CurVal(input: outCur))")
                    .font(.body).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
           
            }
            
        }.sheet(isPresented: $showingInfo, content: {
            InfoView(name: "Currency Convertor")})
        .background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden)
            .navigationTitle("Currency Convertor")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        hideKeyboard()
                    }, label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    })
                    Button(action: {
                        showingInfo.toggle()
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                }
            }
    }
}

struct CurrencyContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyContentView()
    }
}



