import SwiftUI


@main
struct MyApp: App {
    
    
    @StateObject var globalString = GlobalString()
    var color = UserDefaults.standard.string(forKey: "color")
    var finalColor : Color = Color.red
    
   
    
    var body: some Scene {
        WindowGroup {
            ContentView().accentColor(Color(hex2: color ?? "FF0000") ?? .red)
        }
    }
}
