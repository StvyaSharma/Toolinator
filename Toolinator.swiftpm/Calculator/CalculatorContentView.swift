//
//  File.swift
//  
//
//  Created by Stvya Sharma on 04/01/23.
//


import SwiftUI
import Foundation


enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case subtract = "-"
    case add = "+"
    case divide = "/"
    case multiply = "*"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
}

enum Operation {
    case add, subtract, multiplay, divide, equal, none, percent
    
}

struct CalculatorContentView: View {
    
    @State var value = "0"
    @State var runningNumber: Double = 0
    @State var currentOperation: Operation = .none
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight , .nine, .multiply],
        [.four, .five , .six, .subtract],
        [.one, .two, .three , .add],
        [.zero, .decimal, .equal, ]
        ]
    
    @StateObject var globalString = GlobalString()
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack{
                Spacer()
                    Text(value).bold().font(.system(size: 72)).foregroundColor(Color.accentColor)
                }.padding()

            ForEach( buttons, id: \.self) { row in
                HStack(spacing: 12){
                ForEach( row, id: \.self) { item in
                    Button(action: {
                        self.didTap(button: item)
                    }, label: {
                        Text(item.rawValue)
                            .frame(width: self.buttonWidth(item: item), height: self.buttonHeight(item: item))
                            .background(Color(uiColor: UIColor.systemBackground).opacity(0.65)).foregroundColor(Color.accentColor).cornerRadius(self.cornerRadius(item: item))
                            .font(.system(size: 40))
                    })
                        }
                    }
                .padding(.bottom, 3)
            }.frame(maxWidth: UIScreen.main.bounds.width*0.75, maxHeight: UIScreen.main.bounds.height*0.75 )
            }
        }.background{
            RoundedRectangle(cornerRadius: 0.0, style: .continuous).frame(width:2*UIScreen.screenWidth, height: 2*UIScreen.screenHeight).padding(.top)
                .irregularGradient(colors: [globalString.g1, globalString.g2,globalString.g3,globalString.g1, globalString.g2,globalString.g3], backgroundColor: globalString.g4)
        }.scrollContentBackground(.hidden)
            .navigationBarTitle("Calculator").navigationBarTitleDisplayMode(.inline)
    }
    
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero{
            return ((UIScreen.main.bounds.width - (4*12)) / 4 ) * 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    func buttonHeight(item: CalcButton) -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func cornerRadius(item: CalcButton) -> CGFloat {
        if item == .zero{
            return (((UIScreen.main.bounds.width - (4*12)) / 4 ) * 2)/10
        }
        return ((UIScreen.main.bounds.width - (5*12)) / 4)/5
    }
    
    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal, .percent:
            if(button == .add) {
                self.currentOperation = .add
                self.runningNumber = Double(self.value) ?? 0
                self.value = "0"
            }
            else if(button == .subtract) {
                self.currentOperation = .subtract
                self.runningNumber = Double(self.value) ?? 0
                self.value = "0"

            }
            else if(button == .multiply) {
                self.currentOperation = .multiplay
                self.runningNumber = Double(self.value) ?? 0
                self.value = "0"

            }
            else if(button == .divide) {
                self.currentOperation = .divide
                self.runningNumber = Double(self.value) ?? 0
                self.value = "0"

            }
            else if(button == .percent) {
                self.currentOperation = .percent
                self.runningNumber = Double(self.value) ?? 0
                let tmpValue = self.runningNumber / 100
                self.value = String(tmpValue)
                self.runningNumber = 0
                
                

            }
            else if(button == .equal) {
                switch self.currentOperation {
                case .add:
                    let tmpValue = Double(self.value)! + self.runningNumber
                    self.value = String(tmpValue)
                    self.runningNumber = 0
                    if value.contains(".0") {
                        self.value = String(Int(tmpValue))

                    }
                case .subtract:
                    let tmpValue = self.runningNumber - Double(self.value)!
                    self.value = String(tmpValue)
                    self.runningNumber = 0
                    if value.contains(".0") {
                        self.value = String(Int(tmpValue))

                    }
                case .multiplay:
                    let tmpValue = Double(self.value)! * self.runningNumber
                    self.value = String(tmpValue)
                    self.runningNumber = 0
                    if value.contains(".0") {
                        self.value = String(Int(tmpValue))

                    }
                case .divide:
                    let tmpValue = self.runningNumber / Double(self.value)!
                    self.value = String(tmpValue)
                    self.runningNumber = 0
                    if value.contains(".0") {
                        self.value = String(Int(tmpValue))

                    }

                default:
                    break
                }
                
            }
            break
        case .clear:
            self.value = "0"
            self.runningNumber = 0
        case .decimal:
            if(!value.contains(".")){
            self.value = value.appending(".")
            }
        case .negative:
            if(!value.contains("-")){
                self.value = "-".appending(self.value)
            }
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }else{
            self.value = "\(self.value)\(number)"
            }
        }
    }
}

//TestComment

struct CalculatorContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorContentView()
    }
}
