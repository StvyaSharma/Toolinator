import SwiftUI
import IrregularGradient







struct ContentView: View {
    
    
    @State var timeRemaining = 10
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    @State private var textSwitch = false
    var color = UserDefaults.standard.string(forKey: "color")
    
    @State private var showingInfo  = false
    @State private var showingOnboard  = UserDefaults.standard.bool(forKey: "Onboard")
    @State private var showingtrue  = true
    @State private var showingfalse  = false
    @State private var showingSettings  = false
    @State private var showingList = false
    
    
    func check() -> Binding<Bool>  {
        if showingOnboard == false {
            return $showingtrue
        } else {
            return $showingfalse
        }
       
        
    }
    
 
    
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
    
    
    @StateObject fileprivate var viewModel = ToolsViewModel()
    @StateObject private var model = ViewModel()
    @Environment(\.scenePhase) var scenePhase
    
   
  
    var body: some View {
        NavigationView {
           
            let data  = [AnyView(ConversionMainView()), AnyView(NotesContentView()), AnyView(SFSymbolContentView()) ,AnyView(QRGeneratorView()), AnyView(PasswordContentView()), AnyView(WorldClockContentView(zones: getAllZonesTime())),AnyView(CalculatorContentView()),AnyView(MarkDownContentView()),AnyView(TipContentView()),AnyView(MoneyContentView()),AnyView(ColorPickerContentView()),AnyView(ScoresContentView(model: model)),AnyView(CurrencyContentView())] as [AnyView]
            if showingList {

                List(viewModel.tools) { tool in
                    NavigationLink {
                        data[tool.content]
                       
                    } label: {
                        Label("\(tool.title)", systemImage: "\(tool.iconName)")
                    }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))

                    
                    .sheet(isPresented: $showingInfo, content: {
                        InfoView(name: "Main")})
                     .sheet(isPresented: $showingSettings, content: {
                            SettingsView()})
                     .sheet(isPresented: check(), content: {
                         OnboardingView()})
                    
                }.listStyle(.insetGrouped).background{
                    RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 3*UIScreen.screenHeight).padding(.top)
                        .irregularGradient(colors: [g1, g2, g3, g1, g2, g3], backgroundColor: g4)
                }.scrollContentBackground(.hidden).navigationTitle("Toolinator").toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action: {
                            print(showingOnboard)
                            showingSettings.toggle()
                        }, label: {
                            Image(systemName: "gearshape")
                        })
                    }
                    
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingList.toggle()
                        }, label: {
                            if showingList {
                                Image(systemName: "square.grid.2x2")
                            } else {
                                Image(systemName: "list.bullet")
                            }
                        })
                        Button(action: {
                            showingInfo.toggle()
                        }, label: {
                            Image(systemName: "info.circle")
                        })
                        
                    }
                }

            } else {
                ScrollView{
                    VStack(spacing: 40) {
                        HStack(spacing: 30) {
                            MainMenuButtonView(imageName: "compass.drawing",title: "Conversion",content: { ConversionMainView() }
                            )
                            MainMenuButtonView(imageName: "note.text", title: "Notes", content: {NotesContentView()})
                        }
                        HStack(spacing: 30){
                            MainMenuButtonView(imageName: "face.smiling", title: "SF Symbol", content: {SFSymbolContentView()})
                            MainMenuButtonView(imageName: "qrcode", title: "QR Generator", content: {QRGeneratorView()})
                        }
                        HStack(spacing: 30){
                            MainMenuButtonView(imageName: "lock", title: "Password Generator", content: {PasswordContentView()})
                            MainMenuButtonView(imageName: "clock", title: "World Clock", content: {WorldClockContentView(zones: getAllZonesTime())})
                        }
                        HStack(spacing: 30){
                            MainMenuButtonView(imageName: "x.squareroot", title: "Calculator", content: {CalculatorContentView()})
                            MainMenuButtonView(imageName: "text.quote", title: "Markdown Preview", content: {MarkDownContentView()})
                        }
                        HStack(spacing: 30){
                            MainMenuButtonView(imageName: "dollarsign", title: "Tip Calculator", content: {TipContentView()})
                            MainMenuButtonView(imageName: "banknote.fill", title: "Money", content: {MoneyContentView()})
                        }
                        HStack(spacing: 30){
                            MainMenuButtonView(imageName: "eyedropper.halffull", title: "Color Picker", content: {ColorPickerContentView()})
                            MainMenuButtonView(imageName: "sportscourt", title: "Game Score Tracker", content: {ScoresContentView(model: model)})
                        }
                        HStack(spacing: 30){



                            MainMenuButtonView(imageName: "dollarsign", title: "Currency Convertor", content: {CurrencyContentView()})
                        }.sheet(isPresented: $showingInfo, content: {
                            InfoView(name: "Main")})
                         .sheet(isPresented: $showingSettings, content: {
                                SettingsView()})
                         .sheet(isPresented: check(), content: {
                                    OnboardingView()})

                    }.padding(40)
                        .background{
                            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 3*UIScreen.screenHeight).padding(.top)
                                .irregularGradient(colors: [g1, g2, g3, g1, g2, g3], backgroundColor: g4)
                        }.navigationTitle("Toolinator").toolbar {
                            ToolbarItemGroup(placement: .navigationBarLeading) {
                                Button(action: {
                                    print(showingOnboard)
                                    showingSettings.toggle()
                                }, label: {
                                    Image(systemName: "gearshape")
                                })
                            }
                            
                            
                            ToolbarItemGroup(placement: .navigationBarTrailing) {
                                Button(action: {
                                    showingList.toggle()
                                }, label: {
                                    if showingList {
                                        Image(systemName: "square.grid.2x2")
                                    } else {
                                        Image(systemName: "list.bullet")
                                    }
                                })
                                Button(action: {
                                    showingInfo.toggle()
                                }, label: {
                                    Image(systemName: "info.circle")
                                })
                                
                            }
                        }
                    
                }
                
                
                
                
                
                
                
                
                
                
            }
            
            
            
            
            
            
            
            
            
            
            
            
            VStack{
                
           
                Text("🤗").font(.system(size: 96))
                Text("Select One of the Tools").fontWeight(.bold).font(.title)
            }.background{
                RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 3*UIScreen.screenHeight).padding(.top)
                    .irregularGradient(colors: [g1, g2, g3, g1, g2, g3], backgroundColor: g4)
            }
            
            
            
            
            
        }.tint(Color(hex2: color ?? "FF0000"))
    }
}

struct ResultView: View {
    var choice: String
    
    var body: some View {
        Text("You chose \(choice)")
    }
}

struct CircleView: View {
    
    
    let symbol : String
    let title : String
    var body: some View {
        VStack{
            Spacer()
            ZStack {
                Image(systemName: symbol)
                    .font(.title)
                    .frame(width: 65, height: 65)
                    .overlay(
                        Circle().stroke(Color.accentColor, lineWidth: 3)
                    )
            }

            Text(title)
                .font(.subheadline).fontWeight(.bold)
            Spacer()
        }
    }
}
    

struct MainMenuButtonView<Content: View>: View {
    var imageName: String
    var title: String
    var content: () -> Content // change to closure

    // add all parameters in the init
    init(imageName: String, title: String,  @ViewBuilder content: @escaping () -> Content) {
        self.imageName = imageName // assign all the parameters, not only `content`
        self.title = title
        self.content = content
    }

    var body: some View {
        
            NavigationLink(destination: content()) { // use `content()`
                VStack{
                    Spacer()
                    ZStack {
                        Image(systemName: imageName)
                            .font(.title)
                            .frame(width: 65, height: 65)
                            .overlay(
                                Circle().stroke(Color.accentColor, lineWidth: 3)
                            )
                    }

                    Text(title)
                        .font(.subheadline).fontWeight(.bold)
                    Spacer()
                }
            }.frame(minWidth: 90, maxWidth: .infinity, minHeight: 120, maxHeight: .infinity, alignment: .center).padding().background(.regularMaterial).cornerRadius(20)
    }
}


struct Tool: Identifiable {
  var id = UUID()
  var title: String
  var iconName: String
    var content: Int
}

extension Tool {
  static let samples = [
    Tool(title: "Conversion", iconName: "compass.drawing", content: 0),
    Tool(title: "Notes", iconName: "note.text", content: 1),
    Tool(title: "SF Symbol", iconName: "face.smiling", content: 2),
    Tool(title: "QR Generator", iconName: "qrcode", content: 3),
    Tool(title: "Password Generator", iconName: "lock", content: 4),
    Tool(title: "World Clock", iconName: "clock", content: 5),
    Tool(title: "Calculator", iconName: "x.squareroot", content: 6),
    Tool(title: "Markdown Preview", iconName: "text.quote", content: 7),
    Tool(title: "Tip Calculator", iconName: "dollarsign", content: 8),
    Tool(title: "Money", iconName: "banknote.fill", content: 9),
    Tool(title: "Color Picker", iconName: "eyedropper.halffull", content: 10),
    Tool(title: "Game Score Tracker", iconName: "sportscourt", content: 11),
    Tool(title: "Currency Convertor", iconName: "dollarsign", content: 12)
  ]
}


private class ToolsViewModel: ObservableObject {
  @Published var tools: [Tool] = Tool.samples
}



