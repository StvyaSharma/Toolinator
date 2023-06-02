import SwiftUI
import  IrregularGradient

struct ConversionDetailView: View {
    
    @StateObject var viewModel: ConversionDetailViewModel
    @StateObject var globalString = GlobalString()
    
    var body: some View {
        Form {
            Section {
                Text("Select units").listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                    .font(.headline)
                Picker("Convert", selection: $viewModel.firstUnit) {
                    ForEach(0 ..< viewModel.units.count, id: \.self) { Text("\(viewModel.units[$0].symbol)") }
                }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                Picker("To", selection: $viewModel.secondUnit) {
                    ForEach(0 ..< viewModel.units.count, id: \.self) { Text("\(viewModel.units[$0].symbol)") }
                }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
            }
            
            Section {
                Text("Value")
                    .font(.headline).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                TextField("Enter", text: $viewModel.firstUnitValue)
                    .keyboardType(.decimalPad).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
            }
            Section {
                Text("Result")
                    .font(.headline).listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
                Text("\(viewModel.convert(value: viewModel.firstUnitValue, unit1: viewModel.units[viewModel.firstUnit], unit2: viewModel.units[viewModel.secondUnit]), specifier: "%g")").listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
            }
        }
        .sheet(isPresented: $viewModel.showingInfo, content: {
            ConversionInfoView(category: viewModel.category)
        }).background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width:2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden)
            .navigationTitle(viewModel.category.rawValue)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        hideKeyboard()
                    }, label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    })
                    Button(action: {
                        viewModel.showingInfo = true
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                }
            }
    }
}

struct ConversionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionDetailView(viewModel: ConversionDetailViewModel(category: .mass))
    }
}


