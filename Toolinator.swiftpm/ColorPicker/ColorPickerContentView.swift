//
//  File.swift
//  
//
//  Created by Stvya Sharma on 18/01/23.
//

import SwiftUI

struct ColorPickerContentView: View {
    @State private var redColor = Double.random(in: 0...255)
    @State private var greenColor = Double.random(in: 0...255)
    @State private var blueColor = Double.random(in: 0...255)
    
    @State private var showingInfo  = false
    
    @StateObject var globalString = GlobalString()
    
    @FocusState private var focusedField: Field?
    
    func doubledigit(code: String) -> String {
        if code.count == 1 {
            var new = "0" + code
            return new
        }
        return code
    }
    
    var body: some View {
        ScrollView{
            ZStack {
                
                
                VStack(spacing: 40) {
                    ColorView(redColor: redColor, greenColor: greenColor, blueColor: blueColor)
                    
                    VStack {
                        ColorSliderView(value: $redColor, color: .red)
                            .focused($focusedField, equals: .red)
                        ColorSliderView(value: $greenColor, color: .green)
                            .focused($focusedField, equals: .green)
                        ColorSliderView(value: $blueColor, color: .blue)
                            .focused($focusedField, equals: .blue)
                        
                        
                        
                    }
                    .frame(height: 150)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button(action: previousField) {
                                Image(systemName: "chevron.up")
                            }
                            Button(action: nextField) {
                                Image(systemName: "chevron.down")
                            }
                            Spacer()
                            Button("Done") {
                                focusedField = nil
                            }
                        }
                    }
                    Spacer()
                    
                    Text("\("#" + doubledigit(code: String(Int(redColor) , radix: Int(16))) + doubledigit(code: String(Int(greenColor) , radix: Int(16))) + doubledigit(code: String(Int(blueColor) , radix: Int(16))))").font(.title).foregroundColor(Color(uiColor: UIColor.systemBackground)).onTapGesture {
                        let pasteboard = UIPasteboard.general
                        pasteboard.string = "\("#" + doubledigit(code: String(Int(redColor) , radix: Int(16))) + doubledigit(code: String(Int(greenColor) , radix: Int(16))) + doubledigit(code: String(Int(blueColor) , radix: Int(16))))"
                    }
                    Spacer()
                }
                .padding()
            }.navigationTitle("Color Picker").background{
                RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight + 1000).padding(.top)
                    .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
            }.scrollContentBackground(.hidden).sheet(isPresented: $showingInfo, content: {
                InfoView(name: "Color Picker")})
            .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
               
                Button(action: {
                    showingInfo.toggle()
                }, label: {
                    
                    Image(systemName: "info.circle")
                })
               
                
            }
        }
        }}
}

extension ColorPickerContentView {
    private enum Field {
        case red
        case green
        case blue
    }
    
    private func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
    
    private func previousField() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
}


struct ColorPickerContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerContentView()
    }
}

