//
//  File.swift
//  
//
//  Created by Stvya Sharma on 04/01/23.
//

import SwiftUI

struct MarkDownContentView: View {
    
    @State var markdownText = ""
    @StateObject var globalString = GlobalString()
    @State private var showingInfo  = false
    
    var body: some View {
        VStack {
            VStack {
  
                
                TextEditor(text: $markdownText)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding().font(.body)
                    .background(Color(uiColor: .systemBackground).opacity(0.65))
                    .cornerRadius(16)
                    .padding(.bottom, 16)
            }
            
        }.background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width:2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden).sheet(isPresented: $showingInfo, content: {
            InfoView( name: "")}).navigationTitle("Markdown Text").toolbar {
       
            
            
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    showingInfo.toggle()
                }, label: {
                    Image(systemName: "info.circle").font(.body)
                })
                
                NavigationLink(destination:
                MarkDownPreviewView(markdownText: markdownText)
                ) {
                    Image(systemName: "text.badge.checkmark").font(.body)
                                }
                
            }
        }
        .font(.title2)
        .padding()
    }
    

}


struct MarkDownContentView_Previews: PreviewProvider {
    static var previews: some View {
        MarkDownContentView()
    }
}




struct MarkDownPreviewView: View {
    
     var markdownText = ""
    @State private var showingInfo  = false
    @StateObject var globalString = GlobalString()
    
    var body: some View {
        VStack {
            VStack {
                Text(getAttributedString(markdownText)).font(.body)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding()
                    .background(Color(uiColor: .systemBackground).opacity(0.65))
                    .cornerRadius(16)
                    .padding(.bottom, 16)
            }
        }.background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight + 1000).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden).sheet(isPresented: $showingInfo, content: {
            InfoView(name: "")}).navigationTitle("Markdown Preview").toolbar {
                
                
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    
                    Button(action: {
                        showingInfo.toggle()
                    }, label: {
                        Image(systemName: "info.circle").font(.body)
                    })
                    
                }
            }
        .font(.title2)
        .padding()
    }
    
    func getAttributedString(_ markdown: String) -> AttributedString {
        do {
            let attributedString = try AttributedString(markdown: markdown)
            return attributedString
        } catch {
            print("Couldn't parse: \(error)")
        }
        return AttributedString("Error parsing markdown")
    }
}



