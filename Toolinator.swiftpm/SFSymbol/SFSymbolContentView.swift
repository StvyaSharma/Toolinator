//
//  File.swift
//  
//
//  Created by Stvya Sharma on 05/01/23.
//

import SwiftUI
import Combine

struct SymbolRow: View {
    var name: String
    var body: some View {
        VStack {
            Section{
                
                Image(systemName: name).font(.system(size: 32)).padding()
                Text(name)
            }.frame(width: 0.15*UIScreen.screenWidth, height: 0.15*UIScreen.screenWidth).padding(.trailing, 10).padding(.leading,10)
        }.padding(40).background(Color(uiColor: UIColor.systemBackground).opacity(0.65)).cornerRadius(20)
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            searchBar.showsCancelButton = true
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            searchBar.endEditing(true)
            searchBar.showsCancelButton = false
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            searchBar.endEditing(true)
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.autocapitalizationType = .none
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search symbols"
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct SFSymbolContentView: View {
    @State var searchText = ""
    @State private var showingInfo  = false
    @StateObject var globalString = GlobalString()
    @State private var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    @ObservedObject var searchManager = SearchManager()
    
    var body: some View {
        return
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 0) {
                SearchBar(text: $searchManager.searchQuery).padding(.trailing,5).padding(.leading, 5)
                LazyVGrid(columns: columns){
                    
                    ForEach(searchManager.data, id: \.self) { name in
                        SymbolRow(name: name).padding(.bottom,10).padding(.top,10)
                            .onTapGesture {
                                let pasteboard = UIPasteboard.general
                                pasteboard.string = name
                            }
                    }.id(UUID())
                }
            }.sheet(isPresented: $showingInfo, content: {
                InfoView(name: "SF Symbol")}).toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                   
                    Button(action: {
                        showingInfo.toggle()
                    }, label: {
                        
                        Image(systemName: "info.circle")
                    })
                   
                    
                }
            }
            .navigationBarTitle(Text("SF Symbol"))}.background{
                RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                    .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
            }.scrollContentBackground(.hidden)
    }
}

struct SFSymbolContentView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolContentView()
    }
}

class SearchManager: ObservableObject {
    var searchQuery : String = "" {
        didSet {
            data = searchQuery.count > 0 ?
                symbolData.filter { $0.lowercased().contains(searchQuery.lowercased()) }
                : symbolData
        }
    }
    
    @Published var data = symbolData
    
    init() {
        
    }
}
