import SwiftUI
import IrregularGradient

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct ConversionSelectionView: View {
    @State private var showingInfo  = false
//    let gradient = UserDefaults.standard.array(forKey: "gradient") ?? ["2aa100", "079f08", "005805", "115d1e"]
   
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
    
    
    
    var body: some View {

            List {
                Section {
                    ForEach(ConversionCategory.allCases, id: \.self) { category in
                        NavigationLink {
                            ConversionDetailView(viewModel: ConversionDetailViewModel(category: category))
                        } label: {
                            Label(category.rawValue, systemImage: ConversionCategoryManager.getIcon(category: category))
                        }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                    }
                    NavigationLink {
                        RomanConverterView()
                    } label: {
                        Label("Roman Number Convertor", systemImage: "x.square")
                    }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                    NavigationLink {
                        ASCIIConverterView()
                    } label: {
                        Label("ASCII Converter", systemImage: "info.bubble")
                    }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                    NavigationLink {
                        DecimalConverterView()
                    } label: {
                        Label("Decimal Converter", systemImage: "number")
                    }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                }
                
               
            }.sheet(isPresented: $showingInfo, content: {
                InfoView(name:"Conversion")}).background{
                
                
                
                RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                    .irregularGradient(colors: [g1, g2, g3, g1, g2, g3], backgroundColor: g4)
            }.toolbar {
                
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                        showingInfo.toggle()
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    
                }
            }.scrollContentBackground(.hidden)
                .navigationTitle("Conversion").toolbarBackground(
                    
                    // 1
                    .thinMaterial,
                    // 2
                    for: .navigationBar)
            

    }
}

struct ConversionSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionSelectionView()
    }
}


