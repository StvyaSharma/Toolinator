//
//  GradientPickerView.swift
//  My App
//
//  Created by Stvya Sharma on 30/12/22.
//

import SwiftUI
import IrregularGradient



struct GradientPickerView: View {
    
    
    let contacts = [
            "Sun",
            "Dawn",
            "Space",
            "Alpine",
            "Ocean",
            "Maldives",
            "Lush",
            "Teal",
            "Lilac",
            "Christmas",
            "Peach",
            "Combi",
            "Heart",
            "Jshine",
            "Magic",
            "Rastafari",
            "Relaxing Red",
            "Argon",
            "Terminal",
            "Lithium",
            "Love",
            "Trio",
            "Cyber Night",
            "Trio 1",
            "Sunny Beach",
            "Trio 3"
            
        ]
    let colors = [
            ["FFA500","eb455a","FFFF00","FFA500"],
            ["F3904F","976A60","3B4371","4C4A6E"],
            ["000000","1E1E1E","5D5D5D","434343"],
            ["2aa100","079f08","005805","115d1e"],
            ["00a0db","007cc7","1e74bb","274072"],
            ["B2FEFA","0ED2F7","B2FEFA","0ED2F7"],
            ["ADD100","7B920A","ADD100","7B920A"],
            ["AAFFA9","11FFBD","AAFFA9","11FFBD"],
            ["ebc6b6","945a37","b54db2","e066ad"],
            ["CC231E","34A65F","FF000","0F8A5F"],
            ["d53369","cbad6d","D06A6B","FFE5B4"],
            ["00416A","799F0C","FFE000","FFE000"],
            ["e52d27","b31217","e52d27","b31217"],
            ["D16BA5","86A8E7","5FFBF1","86A8E7"],
            ["59C173","a17fe0","5D26C1","a17fe0"],
            ["1E9600","FFF200","5D26C1","FFF200"],
            ["b20a2c","fffbd5","b20a2c","fffbd5"],
            ["03001e","7303c0","ec38bc","fdeff9"],
            ["0f9b0f","000000","0f9b0f","000000"],
            ["6D6027","D3CBB8","D3CBB8","6D6027"],
            ["ff5858","ffc8c8","ff5858","ffc8c8"],
            ["f27a7d","f7d486","c5f9d7","f7d486"],
            ["42047e","07f49e","42047e","07f49e"],
            ["f9f5e0","f5895c","b34ecc","f9f5e0"],
            ["d3eef4","f1eec8","f3a46c","d3eef4"],
            ["aa96f9","f962a0","fcf3c4","aa96f9"]
            
    ]

        // 1
        @State private var selection: String?
        @State private var showingAlert = false

        var body: some View {
            
            VStack {
                // 2
              
                List(contacts, id: \.self, selection: $selection) { contact in
                    
                    let pos = contacts.firstIndex(of: contact)!
                    let color  = colors[pos]
                    let  c1 = Color(hex2: color[0]) ?? .red
                    let c2 = Color(hex2: color[1]) ?? .red
                    let c3 = Color(hex2: color[2]) ?? .red
                    let c4 = Color(hex2: color[3]) ?? .red
                    HStack {
                        Text("\(contact)").font(.headline)
                        Spacer()
                        RoundedRectangle(cornerRadius: 20.0, style: .continuous).frame(width: 0.5*UIScreen.screenWidth, height: 75)
                            .irregularGradient(colors: [c1, c2,c3, c1,c2, c3], backgroundColor: c4)
                        
                    }
                    
                    
                    
                }
             
                
                    // 3
                    
                    VStack {
//                        var pos = contacts.firstIndex(of: selection ?? "Fire")!
//                        var color  = colors[pos]
//                        var c1 = Color(hex2: color[0]) ?? Color(uiColor: UIColor.systemBackground)
//                        var c2 = Color(hex2: color[1]) ?? Color(uiColor: UIColor.systemBackground)
//                        var c3 = Color(hex2: color[2]) ?? Color(uiColor: UIColor.systemBackground)
//
                        Text("Selected : \(selection ?? "N/A")").font(.title2)
//                        Spacer()
//                        RoundedRectangle(cornerRadius: 10.0, style: .continuous).frame(width: 0.5*UIScreen.screenWidth, height: 70)
//                            .irregularGradient(colors: [.pink, .pink,.pink, .pink,.pink, .pink], backgroundColor: .pink)
                        
                        Button(action: {
                            showingAlert = true
//                            let pos = contacts.firstIndex(of: selection ?? "Sun")!
//                            let gradient  = colors[pos]
//                            print(gradient)
//
//                            UserDefaults.standard.set(gradient, forKey: "gradient")
                            
                        }, label: {
                            Text("Confirm Selection")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 280, height: 44)
                                .background(Color.blue)
                                .cornerRadius(12)
                        })
                        .padding(.bottom, 5) .alert(isPresented:$showingAlert) {
                            Alert(
                                title: Text("Restart the app"),
                                message: Text("To change the Background Gradient, you must restart the app."),
                                primaryButton: .destructive(Text("Restart")) {
                                    let pos = contacts.firstIndex(of: selection ?? "Sun")!
                                    let gradient  = colors[pos]
                                    print(gradient)
                                    
                                    UserDefaults.standard.set(gradient, forKey: "gradient")
                                    exit(-1)
                                },
                                secondaryButton: .cancel()
                            )
                        }
                        
                    }.padding(.trailing,20).padding(.leading, 20)
                    
                }
                .navigationTitle("Pick Background")
            
        }
}

struct GradientPickerView_Previews: PreviewProvider {
    static var previews: some View {
        GradientPickerView()
    }
}
