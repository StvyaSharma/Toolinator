//
//  File.swift
//  
//
//  Created by Stvya Sharma on 30/12/22.
//

import SwiftUI
import Foundation

struct PasswordContentView: View {
    @StateObject private var vm = ViewModel()
    @StateObject var globalString = GlobalString()
    @State private var showingInfo  = false
    @State private var showingAlert = false
    
    var body: some View {
        Form {
            Section("Options") {
                Toggle("Symbols", isOn: $vm.containsSymbols)
                Toggle("Uppercase", isOn: $vm.containsUppercase)
                Stepper("Character count: \(vm.length)", value: $vm.length, in: 6...18)
                Button("Generate password", action: vm.createPassword).fontWeight(.semibold)
                    
            }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
            Section("Passwords") {
                List(vm.passwords) { password in
                    HStack {
                        Text("\(password.password)")
                            .padding()
                            .textSelection(.enabled)
                        Spacer()
                        Image(systemName: "lock.fill")
                            .foregroundColor(password.strengthColor)
                        
                        Button {
                            showingAlert = true
                        } label: {
                            Image(systemName: "trash").foregroundColor(.red)
                        }.alert(isPresented:$showingAlert) {
                            Alert(
                                title: Text("Delete Password"),
                                message: Text("Are you sure you want to delete password?"),
                                primaryButton: .destructive(Text("Delete")) {
                                    vm.removePassword(password2: password)
                                },
                                secondaryButton: .cancel()
                            )
                        }
                                    
                    }
                }
            }.listRowBackground(Color(UIColor.systemBackground).opacity(0.65))
        }.sheet(isPresented: $showingInfo, content: {
            InfoView(name:"Password Generator")}).background{
            
            
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width: 2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
            }.scrollContentBackground(.hidden).navigationTitle("Password Generater").toolbar {
         
            
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    var pop = UserDefaults.standard.array(forKey: "password")
                    
                    showingInfo.toggle()
                }, label: {
                    Image(systemName: "info.circle")
                })
                
            }
        }
    }
}

struct PasswordContentView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordContentView()
    }
}


extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    

}


extension PasswordContentView {
    class ViewModel: ObservableObject {
        @Published var passwords: [Password] =  []
        @Published var containsSymbols = true
        @Published var containsUppercase = false
        @Published var length = 10
        
        
        init() {
            initPassword()
        }
        
        func initPassword() {
            let alphabet = "abcdefghijklmnopqrstuvwxyz"
            var base = alphabet + "1234567890"
            var newPassword = ""
            
            if containsSymbols {
                base += "!@#$%^&*±§,.-;()"
            }
            if containsUppercase {
                base += alphabet.uppercased()
            }
            
            for _ in 0..<length {
                let randChar = base.randomElement()!
                newPassword += String(randChar)
            }
            
            let password = Password(password: newPassword, containsSymbols: containsSymbols, containsUppercase: containsUppercase)
            
            withAnimation {
                
                var Data : Array<Any> {
                       get {
                           return   UserDefaults.standard.array(forKey: "password") ?? []
                       }
                   }
          
                if Data != nil {
                    var i = 0
                    while i < Data.count {
                        print(Data)
                        
                        var d1: String {
                            get {
                                return Data[i] as! String
                            }
                        }
                        var d2: Bool {
                            get {
                                return Data[i + 1] as! Bool
                            }
                        }
                        var d3: Bool {
                            get {
                                return Data[i + 2] as! Bool
                            }
                        }
                        var pass = Password(password: d1, containsSymbols: d2, containsUppercase: d3)
                        passwords.insert(pass, at: 0)
                        i += 3
                    }
                } else {
                    passwords.insert(password, at: 0)
                    var pass2 = [passwords[0].password,passwords[0].containsSymbols, passwords[0].containsUppercase]
                    UserDefaults.standard.set(pass2, forKey: "password")
                    
                }
                
                
               
            }
        }
        func createPassword() {
            let alphabet = "abcdefghijklmnopqrstuvwxyz"
            var base = alphabet + "1234567890"
            var newPassword = ""
            
            if containsSymbols {
                base += "!@#$%^&*±§,.-;()"
            }
            if containsUppercase {
                base += alphabet.uppercased()
            }
            
            for _ in 0..<length {
                let randChar = base.randomElement()!
                newPassword += String(randChar)
            }
            
            let password = Password(password: newPassword, containsSymbols: containsSymbols, containsUppercase: containsUppercase)
            
            withAnimation {
                var Data : Array<Any> {
                       get {
                           return   UserDefaults.standard.array(forKey: "password") ?? []
                       }
                   }
                
                    passwords.insert(password, at: 0)
                   var pass2 = Data
                pass2.append(newPassword)
                pass2.append(containsSymbols)
                pass2.append(containsUppercase)
                    UserDefaults.standard.set(pass2, forKey: "password")
                    
                
                
                
               
            }
        }

        
        
        
        func removePassword(password2 : Password){
            for i in 0...(passwords.count - 1) {
                print(i)
                print(passwords[i].password)
                print(password2.password)
                if passwords[i].password == password2.password {
                    passwords.remove(at: i)
                    if passwords.count == 0 {
                        UserDefaults.standard.set([], forKey: "password")
                        break
                    } else {
                        var Data : Array<Any> {
                               get {
                                   return   UserDefaults.standard.array(forKey: "password") ?? []
                               }
                           }
                        var dat2 : Array<Any> = []
                        for s in 0...(passwords.count - 1) {
                            dat2.append(passwords[passwords.count - 1 - s].password)
                            dat2.append(passwords[passwords.count - 1 - s].containsSymbols)
                            dat2.append(passwords[passwords.count - 1 - s].containsUppercase)
                        }
                        UserDefaults.standard.set(dat2, forKey: "password")
                        break
                    }
                }
                
                
            }
            
        }
    }
}
