//
//  WeatherButton.swift
//  weather app ui
//
//  Created by Pradyun Setti on 9/01/21.
//
import SwiftUI

struct WeatherButton: View {
    var Title: String
    var TextColour: Color
    var BGColour: Color
    
    var body: some View {
        Text(Title)
            .frame(width: 280, height: 50)
            .background(BGColour)
            .foregroundColor(TextColour)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(15)
    }
}
