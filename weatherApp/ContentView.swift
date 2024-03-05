//
//  ContentView.swift
//  weatherApp
//
//  Created by Ahmet Burak Dinc on 5.03.2024.
//

import SwiftUI
  

struct ContentView: View { // View is a struct and created and destroyed.
    
    @State private var isNight = false // state is something else. we keep that state.
    
    
    
    var body: some View {
        ZStack { //ZStack can have max 10 views at time. Spacers count.
            BackgroundView(isNight:  isNight )
            VStack{
                CityTextView(cityName: "Bornova,   IZMIR")
                MainWeatherStatusView(mainWeather: isNight ? "cloud.moon.fill" : "cloud.sun.fill", temp: 6 )
                HStack(spacing:20){
                    WeatherDayView(dayOfWeek: "TUE",
                                  imageName: "cloud.sun.fill",
                                  temprature: 12)
                    WeatherDayView(dayOfWeek: "WED",
                                  imageName: "sun.max.fill",
                                  temprature: 21)
                    WeatherDayView(dayOfWeek: "THU",
                                  imageName: "cloud.sun.rain.fill",
                                  temprature: 31)
                    WeatherDayView(dayOfWeek: "FRI",
                                  imageName: "cloud.sun.rain.fill",
                                  temprature: 44)
                    WeatherDayView(dayOfWeek: "SAT",
                                  imageName: "cloud.sun.fill",
                                  temprature: 42)
                     
                }
                
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    WeatherAppButtonView(backgroundColor: Color.mint, textColor: Color.white, title: "Change Day Time")
                }
                Spacer()
            }
                        
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek : String
    var imageName: String
    var temprature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20,weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 40, height: 40)
            Text("\(temprature)°")
                .font(.system(size: 25,weight: .medium))
                .foregroundColor(.white)
        }
        
    }
}

struct BackgroundView: View {
    var isNight : Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : .lightBlue ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium,  design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var mainWeather: String
    var temp: Int
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: mainWeather)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 180, height: 180 )
            
            Text("\(temp)°")
                .font(.system(size: 80,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

