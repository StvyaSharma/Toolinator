import SwiftUI
import IrregularGradient

struct InfoData: Identifiable {
  var id = UUID()
  var title: String
  var iconName: String
    var content: String
}

extension InfoData {
  static let samples = [
    InfoData(title: "Main", iconName: "info", content: "Welcome to Toolinator.\n\n \"Toolinator\" is a productivity app that provides a comprehensive collection of tools to help you manage your day-to-day tasks.\n\n The name of the app is insipred by Dr Heinz Doofenshmirtz, being suffixed with \"inator\".\n\n Toolinator offers a variety of features including a unit converter, QR code generator, SF symbols library, notes, password generator, world clock, markdown previewer, calculator, tip calculator, money tracker, game score tracker, color picker, BMI calculator, and currency value converter. Whether you need to quickly calculate a tip, convert units, or keep track of your finances, Toolinator has you covered. With its user-friendly interface and intuitive design, Toolinator makes it easier than ever to boost your productivity and get things done.\n\n Touch any of the following tools to use the tools. \n\n You can also change the accent color and background of the app through settings. You can can go to settings by the touching the gear shaped icon on the top left hand side of the main screen.\n\n You can change the view of the main page as well from the a grid view to a list view according to your ease. You can do so by touching the icon in the top right hand side of the page , next to the info button."),
    InfoData(title: "Conversion", iconName: "compass.drawing", content: "Conversion tools help you convert between different units. \n\n Choose any of the options to use the tool."),
    InfoData(title: "Notes", iconName: "note.text", content: "Notes let you keep your important notes at one place, next to your important tools.\n\n Press on the \"Plus Button\" on the top right corner next to the info button to add a new note. \n\n To delete a note swipe left on the note. "),
    InfoData(title: "Roman Number Convertor", iconName: "x.square", content: "This tool let you convert roman numerials to intergers, making it easy for you to understand.\n\n\n Roman numerals are a numeral system that originated in ancient Rome and remained the usual way of writing numbers throughout Europe well into the Late Middle Ages. Numbers are written with combinations of letters from the Latin alphabet, each letter with a fixed integer value, modern style uses only these seven: I,V,X,L,C,D,M."),
    InfoData(title: "ASCII Converter", iconName: "info.bubble", content: "This tool let your convert characters into the character ascii code. \n\n\n ASCII, abbreviated from American Standard Code for Information Interchange, is a character encoding standard for electronic communication. ASCII codes represent text in computers, telecommunications equipment, and other devices."),
    InfoData(title: "Decimal Converter", iconName: "number", content: " This tool can be used to convert decimal from one base system to another base system."),
    InfoData(title: "SF Symbol", iconName: "face.smiling", content: "This tool can be used to browse the library of iconography made by Apple."),
    InfoData(title: "QR Generator", iconName: "qrcode", content: "This tool can be used to generate QR Code.\n\n Type in the text in the text field in the middle of the screen to generate the QR Code.\n\n Press the Share button at the top right corner, next to info button to share the QR Code. \n\n\n\n A QR code (an initialism for quick response code) is a type of matrix barcode (or two-dimensional barcode) invented in 1994 by Japanese company Denso Wave. A barcode is a machine-readable optical label that can contain information about the item to which it is attached. In practice, QR codes often contain data for a locator, identifier, or tracker that points to a website or application. QR codes use four standardized encoding modes (numeric, alphanumeric, byte/binary, and kanji) to store data efficiently; extensions may also be used."),
    InfoData(title: "Password Generator", iconName: "lock", content: "Password Generator can be use to generate password. You can also whose different paramters to be used in the password. Click on the password to delete the password."),
    InfoData(title: "World Clock", iconName: "clock", content: " World clock can be used to check time from all around the globe. You can use the search bar to search for a particular city or place."),
    InfoData(title: "Calculator", iconName: "x.squareroot", content: ""),
    InfoData(title: "Markdown Preview", iconName: "text.quote", content: "This can be used to see markdown preview."),
    InfoData(title: "Link Bookmark", iconName: "bookmark", content: ""),
    InfoData(title: "Font Previwer", iconName: "textformat.alt", content: "This tool can be used to check different fonts in differenet sizes and color."),
    InfoData(title: "Tip Calculator", iconName: "dollarsign", content: "This tool can be used to calculate tip and also to slit between people."),
    InfoData(title: "Money", iconName: "banknote.fill", content: "This is used to keep a note of your purchases."),
    InfoData(title: "Color Picker", iconName: "eyedropper.halffull", content: "This tool can be used to find different color and the color hex codes."),
    InfoData(title: "Game Score Tracker", iconName: "sportscourt", content: "This tool can be used to keep track of game scores. You can add as many players as you want by pressing the \"Add Player\" Button. You can reload the scores of each player to zero pressing the reload icon on the top left hand side of the screen. You can start a new game by pressing  the trashbin button on the top right corner of the screen, next to the info button."),
    InfoData(title: "BMI Calculator", iconName: "figure.stand", content: "This tool can be used to find BMI easily and fast."),
    InfoData(title: "Currency Convertor", iconName: "dollarsign", content: "This tool can be used to value of one currency to another.")
  ]
}


private class InfoDataViewModel: ObservableObject {
  @Published var infodata: [InfoData] = InfoData.samples
}




struct InfoView: View {
    
    @StateObject fileprivate var viewModel = InfoDataViewModel()
    @Environment(\.dismiss) var dismiss
    @StateObject var globalString = GlobalString()
    var color = UserDefaults.standard.string(forKey: "color")
    
    let name : String
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "\(checkData(name: name).iconName)")
                    .foregroundColor(.accentColor)
                Text("\(checkData(name: name).title)")
                    .font(.title2)
                    .bold()
            }
            .padding(.top, 75)
            
            ScrollView{
                Text("\(checkData(name: name).content)")
                    .padding(20)
            }
            Spacer()
            
            Button(action: {
                
                dismiss()
            }, label: {
                Text("OK")
                    .font(.headline)
                    .bold()
                    .foregroundColor(Color(uiColor: UIColor.systemBackground))
                    .frame(width: 280, height: 44)
                    .background(Color.accentColor)
                    .cornerRadius(12)
            })
            .padding(.bottom, 55)
        }.padding(10).background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight + 1000).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden)
    }
    
    
    func checkData(name: String) -> InfoData {
        let sus = viewModel.infodata
        for i in sus{
            if i.title == name {
                return i
            }
        }
        return sus[0]
    }
    
    
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(name: "")
    }
}


