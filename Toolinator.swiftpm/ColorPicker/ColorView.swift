//
//  File 5.swift
//  
//
//  Created by Stvya Sharma on 18/01/23.
//

import SwiftUI


struct ColorView: View {
    
    let redColor: Double
    let greenColor: Double
    let blueColor: Double
    
    var body: some View {
        Color(red: redColor / 255, green: greenColor / 255, blue: blueColor / 255)
            .cornerRadius(0.6*UIScreen.screenWidth)
            .frame(minWidth: 0.1*UIScreen.screenWidth,maxWidth: 0.6*UIScreen.screenWidth, minHeight: 0.1*UIScreen.screenWidth, maxHeight: 0.6*UIScreen.screenWidth)
            .overlay(
                RoundedRectangle(cornerRadius: 0.6*UIScreen.screenWidth)
                    .stroke(Color(uiColor: UIColor.systemBackground), lineWidth: 4)
            )
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(redColor: 100, greenColor: 100, blueColor: 100)
    }
}

