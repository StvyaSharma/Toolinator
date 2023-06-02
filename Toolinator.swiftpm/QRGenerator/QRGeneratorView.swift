//
//  File.swift
//  
//
//  Created by Stvya Sharma on 29/12/22.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import IrregularGradient

struct QRGeneratorView: View {
    
    
    var gradient : Array<Any> {
            get {
             return  UserDefaults.standard.array(forKey: "gradient") ?? ["2aa100", "079f08", "005805", "115d1e"]
            }
        }
    
    var g1: Color {
        get {
            return Color(hex2: gradient[0] as! String) ?? .orange
        }
    }
    var g2: Color {
        get {
            return Color(hex2: gradient[1] as! String) ?? .pink
        }
    }
    var g3: Color {
        get {
            return Color(hex2: gradient[2] as! String) ?? .yellow
        }
    }
    var g4: Color {
        get {
            return Color(hex2: gradient[3] as! String) ?? .orange
        }
    }
    
    
    
   private var qrGen = QRCode()
   @State private var text = ""
    @State private var showingInfo  = false
   
   var body: some View {
      VStack {
         ZStack {
             Color(UIColor.systemBackground).opacity(0.65)
            qrGen.generateQRCode(from: "\(text)")
               .interpolation(.none)
               .resizable()
               .scaledToFit()
               .frame(width: 0.75*UIScreen.screenWidth - 20, height: 0.75*UIScreen.screenWidth - 20)
               .cornerRadius(20)
         }
         .cornerRadius(20)
         .frame(width: 0.75*UIScreen.screenWidth, height: 0.75*UIScreen.screenWidth)
         Spacer()
         TextField("Enter Text", text: $text)
              .frame(width: 0.75*UIScreen.screenWidth).background(Color(UIColor.systemBackground).opacity(0.65)).cornerRadius(5)
          Spacer()
          Spacer()
      }.sheet(isPresented: $showingInfo, content: {
          InfoView(name: "QR Generator")}).background{
          RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width:2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                  .irregularGradient(colors: [g1, g2, g3, g1, g2, g3], backgroundColor: g4)
      }.scrollContentBackground(.hidden).navigationTitle("QR Generator").toolbar {
          ToolbarItemGroup(placement: .navigationBarTrailing) {
             
              Button(action: {
                  showingInfo.toggle()
              }, label: {
                  
                  Image(systemName: "info.circle")
              })
             
              var photo = qrGen.generateQRCode(from: "\(text)")
              ShareLink(item: photo, preview: SharePreview("QR Code", image: photo))
              
          }
      }
   }
}

struct QRGeneratorView_Previews: PreviewProvider {
   static var previews: some View {
       QRGeneratorView()
   }
}

