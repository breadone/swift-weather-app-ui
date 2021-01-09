//
//  ContentView.swift
//  weather app ui
//
//  Created by Pradyun Setti on 9/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        
        ZStack {
            BackgroundView(topColour: isNight ? .black : .blue,
                           bottomColour: isNight ? .gray : Color("LightBlueGradient"))
            
            VStack {
                CityTextView(CityName: "AUCKLAND, NZ")
                
                MainWeatherView(WeatherImage: isNight ? "cloud.moon.fill" : "cloud.sun.fill", temperature: "20")
                
                HStack(spacing: 20) {
                    WeatherDayView(DayOfWeek: "Tue",
                                   imageName: "cloud.sun.fill",
                                   temp: "19")
                    WeatherDayView(DayOfWeek: "Wed",
                                   imageName: "sun.max.fill",
                                   temp: "20")
                    WeatherDayView(DayOfWeek: "Thurs",
                                   imageName: "cloud.sun.rain.fill",
                                   temp: "23")
                    WeatherDayView(DayOfWeek: "Fri",
                                   imageName: "sun.haze.fill",
                                   temp: "22")
                    WeatherDayView(DayOfWeek: "Sat",
                                   imageName: "cloud.bolt.rain.fill",
                                   temp: "20")
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label : {
                    WeatherButton(Title: "hey lol press me 😳",
                                  TextColour: .blue,
                                  BGColour: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var DayOfWeek: String
    var imageName: String
    var temp: String
    
    var body: some View {
        VStack{
            Text(DayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColour: Color
    var bottomColour: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColour, bottomColour]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var CityName: String
    
    var body: some View {
        Text(CityName)
            .font(.system(size: 25, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 15)
            .padding(.bottom, 20)
    }
}

struct MainWeatherView: View {
    var WeatherImage: String
    var temperature: String
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: WeatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 150)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }
        .padding(.bottom, 50)
    }
}


