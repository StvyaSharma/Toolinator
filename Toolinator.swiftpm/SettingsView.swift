//
//  SettingsView.swift
//  My App
//
//  Created by Stvya Sharma on 30/12/22.
//

import Foundation
import SwiftUI
import IrregularGradient





struct SettingsView: View {
    
    
    
    @Environment(\.dismiss) var dismiss
    @StateObject var globalString = GlobalString()
    @State var color = Color(uiColor: UIColor.tintColor)
    @State private var showingAlert = false
    
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                
                HStack {
                    Image(systemName: "gear")
                        .foregroundColor(globalString.color)
                    Text("Settings")
                        .font(.title)
                        .bold()
                }
                .padding(.top, 75)
                
                
                HStack{
                    ColorPicker("Set Accent Color", selection: $color)
                    Button("Confirm") {
                              showingAlert = true
                    }.foregroundColor(.blue)
                          .alert(isPresented:$showingAlert) {
                              Alert(
                                  title: Text("Restart the app"),
                                  message: Text("To change the Accent Color, you must restart the app."),
                                  primaryButton: .destructive(Text("Restart")) {
                                      let colorhex = color.toHex()
                                      UserDefaults.standard.set(colorhex, forKey: "color")
                                      exit(-1)
                                  },
                                  secondaryButton: .cancel()
                              )
                          }
                }
                    NavigationLink { GradientPickerView()} label: {
                        HStack{
                            Text("Pick Gradient")
                            Spacer()
                            Image(systemName: "circle.hexagongrid.fill").renderingMode(.original)
                        }
                    }
                
             
                
            }
                
                Button(action: {
                   
                    dismiss()
                }, label: {
                    Text("OK")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 280, height: 44)
                        .background(Color.blue)
                        .cornerRadius(12)
                })
                .padding(.bottom, 55)
            }
    }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


