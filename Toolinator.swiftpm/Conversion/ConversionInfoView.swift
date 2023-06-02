import SwiftUI
import IrregularGradient

struct ConversionInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    var category: ConversionCategory
    @StateObject var globalString = GlobalString()
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: ConversionCategoryManager.getIcon(category: category))
                    .foregroundColor(.accentColor)
                Text(category.rawValue)
                    .font(.title2)
                    .bold()
            }
            .padding(.top, 75)
            
            Text(ConversionCategoryManager.getInfo(categoty: category))
                .padding(20)
            Spacer()
            
            Button(action: {
                dismiss()
            }, label: {
                Text("OK")
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 280, height: 44)
                    .background(Color.accentColor)
                    .cornerRadius(12)
            })
            .padding(.bottom, 55)
        }.background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight + 1000).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden)
    }
}

struct ConversionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionInfoView(category: .mass)
    }
}


