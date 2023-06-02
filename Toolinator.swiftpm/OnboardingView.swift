//
//  OnboardingView.swift
//  Toolinator
//
//  Created by Stvya Sharma on 19/01/23.
//

import Foundation
import SwiftUI
import IrregularGradient
import UIKit

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var globalString = GlobalString()
    @State var color = Color(uiColor: UIColor.tintColor)
    @State private var showingAlert = false
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                AppIcon().cornerRadius(10).padding(.top,30).minimumScaleFactor(0.5)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,50).minimumScaleFactor(0.5)
                
                Text("Welcome to").font(.system(size: 0.12*UIScreen.screenWidth)).fontWeight(.semibold).padding(.top,-5).minimumScaleFactor(0.5)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,50).minimumScaleFactor(0.5)
                Text("Toolinator").font(.system(size: 0.1*UIScreen.screenWidth)).bold().minimumScaleFactor(0.5)
                    .frame(maxWidth: .infinity, alignment: .leading).padding(.leading,50).minimumScaleFactor(0.5).foregroundColor(Color.accentColor).fontWeight(.bold)
                   
                Spacer()

                
                ScrollView{
                    
                    VStack(spacing: 20) {
                        Spacer()
                        HStack{
                            Spacer()
                            Image("image5") .resizable()
                                .frame(width: 40, height: 40, alignment: .bottom)
                            Spacer()
                            
                            VStack{
                                Text("Built for Developers").bold()
                                Text(" Increases your\n productivity by many\n folds").foregroundColor(Color(uiColor: UIColor.systemGray))
                            }
                            Spacer()
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            Spacer()
                            Image("image1") .resizable()
                                .frame(width: 40, height: 40, alignment: .bottom)
                            Spacer()
                            
                            VStack{
                                Text("All tools you need").bold()
                                Text("Has all the tools    \nthat you need ").foregroundColor(Color(uiColor: UIColor.systemGray))
                            }
                            Spacer()
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            Spacer()
                            Image("image2") .resizable()
                                .frame(width: 40, height: 40, alignment: .bottom)
                            Spacer()
                            
                            VStack{
                                Text("All things Here").bold()
                                Text("Find all kind of  \n tools").foregroundColor(Color(uiColor: UIColor.systemGray))
                            }
                            Spacer()
                            Spacer()
                        }
                        Spacer()

                        HStack{
                            Spacer()
                            Image("image3") .resizable()
                                .frame(width: 40, height: 40, alignment: .bottom)
                            Spacer()
                            
                            VStack{
                                Text("It's Damn Fast").bold()
                                Text("Gets you results\n instantly").foregroundColor(Color(uiColor: UIColor.systemGray))
                            }
                            Spacer()
                            Spacer()
                        }

                    }
                }
                
                
                Button(action: {
                    UserDefaults.standard.set(true, forKey: "Onboard")
                    dismiss()
                }, label: {
                    Text("OK")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 280, height: 44)
                        .background(Color.blue)
                        .cornerRadius(12)
                })
                .padding(.bottom, 50)
            }
    }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}



extension Bundle {
    var iconFileName: String? {
        guard let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
              let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
              let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
              let iconFileName = iconFiles.last
        else { return nil }
        return iconFileName
    }
}

struct AppIcon: View {
    var body: some View {
        Bundle.main.iconFileName
            .flatMap { UIImage(named: $0) }
            .map { Image(uiImage: $0) }
    }
}




