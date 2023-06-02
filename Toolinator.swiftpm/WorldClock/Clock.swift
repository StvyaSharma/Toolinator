//
//  File 2.swift
//  
//
//  Created by Stvya Sharma on 06/01/23.
//

import SwiftUI
import UIKit



struct Card: View {

    var zone: Zone
    
    var body: some View {
        
        VStack(alignment: .center, spacing: -5){
           
            Text(getTimeFromZone(timeZone: zone.timeZone))
                .font(Font.custom("Avenir", size: 30))
                .fontWeight(.heavy).foregroundColor(Color.accentColor)
                .padding(.top, 2).padding(10).padding(.top, 10)
            
            let city = zone.timeZone.identifier.split(separator: "/")
            
            Section{
                if city.count > 1 {
                    Text("\(name(city_name: String(city[1]) ))")
                        .font(.body)
                        .fontWeight(.light)
                        .lineLimit(1).padding(.bottom,20)
                        
                        
                }
            }
        }.background{
            Color(uiColor: UIColor.systemBackground).opacity(0.65)
        }.cornerRadius(20).frame(width: 0.4*UIScreen.screenWidth, height: 0.3*UIScreen.screenWidth)
        
    }
    
    func name(city_name : String) -> String {
        var stringarr = Array(city_name)
        var i = 0
        while i < stringarr.count {
            if stringarr[i] == "_" {
                stringarr[i] = " "
            }
            i+=1
        }
        var result = String(stringarr)
        return result
    }
}

