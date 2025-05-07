//  WeatherData.swift
//  WindDown
//  Created by Lauren Galarza on 12/8/24.
//  Struct for decoding weather data fetched from OpenWeatherMap API

import Foundation

//This struct maps the JSON response and extracts: temperature, wind speed, and humidity data.
//API uses imperial units, which is detailed below.

struct WeatherData: Decodable {
    
    let main: Main  //Main weather data, including temperature and humidity
    let wind: Wind  //Wind data including speed
    
    //Decodes necessary Main weather data
    struct Main: Decodable {
        let temp: Double //Temperature, Imperial Unit: Fahrenheit
        let humidity: Int  //Humidity, Percentage
    }
    
    //Decodes speed from wind Data
    struct Wind: Decodable {
        let speed: Double   //Wind Speed, Imperial Unit: Miles/Hour
    }
    


    
    
}
