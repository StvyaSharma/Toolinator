//
//  File.swift
//  
//
//  Created by Stvya Sharma on 18/01/23.
//

import SwiftUI

struct MoneyContentView: View {
    @StateObject var expenses = Expenses()
    @StateObject var globalString = GlobalString()
    @State private var showingAddExpense = false
    @State private var showingInfo  = false
    
    var body: some View {
        Section{
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                            Text(item.type)
                                .font(.subheadline)
                                .foregroundColor(.secondary).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD")).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                    }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                }
                .onDelete(perform: removeItems)
            }.background{
                RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                    .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
            }.scrollContentBackground(.hidden)
                .navigationTitle("Money")
                .toolbar {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: expenses)
                }
        }.background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden).sheet(isPresented: $showingInfo, content: {
            InfoView(name: "Money")})
        .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
           
            Button(action: {
                showingInfo.toggle()
            }, label: {
                
                Image(systemName: "info.circle")
            })
           
            
        }
    }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct MoneyContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyContentView()
    }
}

