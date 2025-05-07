//
//  InsightsView.swift
//  WindDown
//
//  Created by Lauren Galarza on 11/17/24.
//

import SwiftUI

struct InsightsView: View {
    @StateObject private var viewModel = InsightsViewModel()
    @State private var city: String = "New York" //city name
    
    @State private var cityInsight = InsightsViewModel().generateInsight()
    
    
    
    var body: some View {
        
        @State var cityInsight = viewModel.generateInsight()
        
        
        ZStack{
            
            Color.insightsButtonBackground
                .ignoresSafeArea()
            

            VStack{

                        
                            
                Text("Current Weather")
                    .font(Font.custom("Jaro", size: 40))
                    .foregroundStyle(Color.insightsButtonText)
                    .tracking(2)
                    .padding()
                    .shadow(radius: 2, y: 5)
                
                HStack{
                    
                    TextField("Enter City Name", text: $city)
                        //.placeholder("placeholder", when: text.isEmpty)
                        .padding(.horizontal)
                        .font(Font.custom("Jaro", size: 20))
                        .foregroundStyle(Color.journalAccent1)
                        
                    
                    
                    
                    Button("Refresh Data"){
                        viewModel.getWeather(for: city)
                    }
                    .padding()
                    .background(Color.insightsButtonText)
                    .font(Font.custom("Jaro", size: 20))
                    .foregroundStyle(Color.journalAccent1)
                    
                }
                .background(Rectangle()
                    .fill( Color.insightsButtonText)
                        .shadow( radius: 2, y: 5)
                
                
                )
                .padding()

        
        
                Spacer()
                if city.isEmpty {
                                    
                                    Rectangle()
                                    
                                        .fill(Color.insightsButtonText)
                                        //.frame(maxHeight: 175)
                                        .overlay(
                                            
                                            Text("Plug in your city to view the weather and insight into how it will affect your sleep.")
                                                .font(Font.custom("Jaro", size: 24))
                                                .tracking(1)
                                                .foregroundStyle(Color.journalAccent1)
                                                .padding()
                                            
                                            
                                        )
                                        .background(Rectangle()
                                            .fill( Color.journalAccent1)
                                            .shadow( radius: 2, y: 5)
                                                    
                                        )
                                    
                                }
                else if let weather = viewModel.weatherData {
                    
                    
                    VStack(){
                        
                        Text("Temperature")
                            .font(Font.custom("Jaro", size: 24))
                            .foregroundStyle(Color.insightsButtonText)
                            .underline()
                        Text("\(weather.main.temp, specifier: "%.1f") ºF")
                            .font(Font.custom("Jaro", size: 24))
                            .foregroundStyle(Color.insightsButtonText)
                        
                        Spacer()
                        Text("Humidity")
                            .font(Font.custom("Jaro", size: 24))
                            .foregroundStyle(Color.insightsButtonText)
                            .underline()
                        Text("\(weather.main.humidity) %")
                            .font(Font.custom("Jaro", size: 24))
                            .foregroundStyle(Color.insightsButtonText)
                        
                        Spacer()
                        
                        Text("Wind")
                            .font(Font.custom("Jaro", size: 24))
                            .foregroundStyle(Color.insightsButtonText)
                            .underline()
                        Text("\(weather.wind.speed, specifier: "%.1f") mph")
                            .font(Font.custom("Jaro", size: 24))
                            .foregroundStyle(Color.insightsButtonText)
                            .underline()
                        
                        
                    }
                    
                    .padding()
                    
                    .background(Rectangle()
                        .fill( Color.journalAccent1)
                        .shadow( radius: 2, y: 5)
                                
                    )
                    
                    
                    
                    
                    
                    
                    VStack{
                        
                        Text("Sleep Insight")
                            .font(Font.custom("Jaro", size: 35))
                            .tracking(2)
                            .foregroundStyle(Color.insightsButtonText)
                            .shadow(radius: 2, y: 5)
                        
                        
                        Rectangle()
                        
                            .fill(Color.insightsButtonText)
                            .frame(maxHeight: 175)
                            .overlay(
                                
                                Text(cityInsight)
                                    .font(Font.custom("Jaro", size: 24))
                                    .tracking(1)
                                    .foregroundStyle(Color.journalAccent1)
                                    .padding()
                                
                                
                            )
                            .background(Rectangle()
                                .fill( Color.journalAccent1)
                                .shadow( radius: 2, y: 5)
                                        
                            )
                        
                        
                        
                    }.padding()
                    
                    
                    
                }
                 
                
            }
                .padding()

            
            
            
            
        }
        
        //default api call without user input
        .onAppear {
            
        viewModel.getWeather(for: "New York")
            
        }
        

    }
    
}

#Preview {
    InsightsView()
}
