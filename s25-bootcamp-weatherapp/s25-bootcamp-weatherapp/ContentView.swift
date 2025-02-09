//
//  ContentView.swift
//  weatherapp
//
//  Created by Rudy Patel on 2/16/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack
        {
            Current(loco: "Chapel Hill", dgrs: "53", weather: "Sunny", high: "55", low: "40")
            Hourly()
            TenDay()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom))
    }
}
struct Current: View {
    var loco: String
    var dgrs: String
    var weather: String
    var high: String
    var low: String
    var body: some View {
        VStack
        {
            Text(loco)
                .font(.system(size: 40))
                .fontWeight(.light)
                .foregroundColor(.white)
            Text("  " + dgrs + "°")
                .font(.system(size: 90))
                .fontWeight(.light)
                .foregroundColor(.white)
            Text(weather)
                .foregroundColor(.white)
                .opacity(0.7)
            HStack
            {
                Text("H:"+high + "°" )
                Text("L:"+low + "°")

            }
            .foregroundColor(.white)
        }
    }
}
struct Hourly: View{
    let time: [String] = ["Now", "1PM", "2PM", "3PM", "4PM", "5PM"]
    let temp: [String] = ["53", "52", "52", "50", "51", "48"]
    let weather: [String] = ["sun.max.fill", "sun.max.fill", "sun.max.fill", "cloud.sun.fill", "cloud.sun.fill", "cloud.sun.fill"]
    var body: some View
    {
        VStack(alignment: .leading, spacing: 10)
        {
            HStack
            {
                Image(systemName: "clock")
                Text("HOURLY FORECAST")
            }
            .foregroundColor(.white)
            .opacity(0.7)
            .font(.caption)
        
            HStack(spacing: 38) //Time
            {
                ForEach(time, id: \.self)
                { i in Text("\(i)")
                }
            }
            .fontWeight(.bold)
            .font(.system(size: 11))
            .foregroundColor(.white)
            
            HStack(spacing: 32) //Icon
            {
                ForEach(weather, id: \.self)
                { iconName in Image(systemName: iconName)
                }
                .foregroundStyle(.yellow, .orange)
                .font(.system(size: 24))
                
            }
            HStack(spacing: 38) //Temp
            {
                ForEach(temp, id: \.self)
                { i in Text("\(i)°")
                }
                .font(.system(size: 14))
                .fontWeight(.bold)
            }
            .foregroundColor(.white)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue.opacity(0.25)))
    }
}

struct TenDay: View
{
    let dayOfWeek: [String] = ["Today", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun", "Mon", "Tue"]
    let highTemp: [String] = ["78°", "76°", "74°", "72°", "70°", "68°", "66°", "75°", "77°","79°"]
    let lowTemp: [String] = ["60°", "58°", "57°", "55°", "53°", "52°", "50°", "62°", "63°", "64°"]
    let weatherIcons: [String] = ["sun.max.fill", "cloud.sun.fill", "cloud.fill", "rain.fill", "cloud.bolt.fill", "cloud.bolt.fill", "wind", "cloud.drizzle.fill", "cloud.fog.fill", "cloud.sun.fill", "cloud.fill"]
    let bar: Rectangle = Rectangle()
    
    var body: some View
    {
        HStack(spacing: 30)
        {
            VStack(spacing: 13.5) //Day
            {
                ForEach(dayOfWeek, id: \.self)
                { i in Text("\(i)")
                }
                .fontWeight(.bold)
                .foregroundColor(.white)
            }
            VStack(spacing: 13) //Weather
            {
                ForEach(weatherIcons, id: \.self)
                { iconName in Image(systemName: iconName)
                }
                .scaledToFit()
                .foregroundStyle(.white, .yellow)
            }
            VStack(spacing: 13) //Low
            {
                ForEach(lowTemp, id: \.self)
                { i in Text("\(i)")
                }
                .fontWeight(.regular)
                .foregroundColor(.white)
                .opacity(0.7)
            }
            VStack(spacing: 31) //bar
            {
                ForEach(0 ..< dayOfWeek.count, id: \..self)
                { _ in Rectangle()
                }
                .frame(width: 85, height: 2)
                .foregroundColor(.blue)
            }
            VStack(spacing: 13) //High
            {
                ForEach(highTemp, id: \.self)
                { i in Text("\(i)")
                }
                .fontWeight(.regular)
                .foregroundColor(.white)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue.opacity(0.25)))
        Spacer()
    }
}
  






#Preview {
    ContentView()
    
}
