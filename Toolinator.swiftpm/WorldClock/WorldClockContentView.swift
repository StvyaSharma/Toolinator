//
//  File.swift
//  
//
//  Created by Stvya Sharma on 06/01/23.
//

import SwiftUI

struct WorldClockContentView: View {
    @State private var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @State var zones: [Zone]
    @StateObject var globalString = GlobalString()
    @State var searchCity = ""
    @State var isSearching = false
    @State private var showingInfo  = false
    
    var body: some View {
        VStack{
            HStack{
                
            
                    
                    HStack{
                        HStack{
                            
                            
                            Image(systemName: "magnifyingglass")
                            
                            TextField("Search city", text: $searchCity)
                            
                            if isSearching {
                                Button(action: {
                                    searchCity = ""
                                }, label: {
                                    Image(systemName: "xmark.circle")
                                    
                                })
                            }
                            
                            
                            
                        }
                        .padding()
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .onTapGesture(count: 1, perform: {
                            isSearching.toggle()
                        })
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                        
                        if isSearching{
                            Button(action: {
                                searchCity = ""
                                isSearching.toggle()
                                UIApplication.shared.dismisKeyboard()
                            }, label: {
                                Text("Cancel")
                                    .padding(.trailing)
                                    .padding(.leading, 0)
                                
                            })
                            .padding()
                        }
                    }
                
            }
            
        
    
            ScrollView(.vertical, showsIndicators: true) {
                
                LazyVGrid(columns: columns){
                    
                    ForEach(zones.filter({"\($0)".lowercased().contains(searchCity.lowercased()) || searchCity.isEmpty})){ zone in
                        Card(zone: zone)
                    }
                }
            }.sheet(isPresented: $showingInfo, content: {
                InfoView(name: "World Clock")}).toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                   
                    Button(action: {
                        showingInfo.toggle()
                    }, label: {
                        
                        Image(systemName: "info.circle")
                    })

                    
                }
            }.navigationTitle("World Clock").navigationBarTitleDisplayMode(.inline)
        }.background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden)
        
    }
}

struct WorldClockContentView_Previews: PreviewProvider {
    static var previews: some View {
        WorldClockContentView(zones: getAllZonesTime())
    }
}

extension UIApplication{
    func dismisKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

