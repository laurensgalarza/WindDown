//  InsightsViewModel.swift
//  WindDown
//  Created by Lauren Galarza on 12/8/24.
//  


import Foundation
import SwiftUI

// This view model fetches weather data from OpenWeatherMap API based on a given city.
// The decoded data is used to generate personalized sleep-related insights 

class InsightsViewModel: ObservableObject{
    
    @Published var weatherData: WeatherData? //holds the decoded weather data
    @Published var errorMessage: String? //holds error messages

    //weather-based insight list
    let insights: [String:String] = [
        ["default" : "Weather greatly influences sleep quality and comfort every night."],
        ["lowTemp" : "Cool weather promotes deep, restorative sleep."],
        ["lowHumid" : "Low humidity may cause dryness; consider using a humidifier."],
        ["lowWind": "A gentle breeze can aid in cooling tonight."],
        ["midTemp" : "Enjoy tonight's refreshing, comfortable sleeping conditions."],
        ["midHumid" : "Humidity is perfect for a restful night's sleep."],
        ["midWind" : "Windy night ahead; meditative sounds can help relax."],
        ["highTemp" : "Stay cool tonight with a fan or cool shower."],
        ["highHumid" : "High humidity may feel sticky; use a fan."],
        ["highWind" : "Strong winds tonight may disturb your sleep. Try white noise or earplugs to stay grounded."],
        ["xhighTemp" : "High heat may disrupt sleep; hydrate and stay cool."],
    ]
    
    //Retrieves data from OpenWeatherMap API and decodes it into WeatherData model.
    func getWeather(for city: String){
        
        let apiKey = "b0a3acbcc9a70c3b77daf3c54210c850" //API key from personal account
        let baseURLString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=imperial&appid=\(apiKey)"    //OpenWeather api url

        //handle errors
        //url not valid
        guard let url = URL(string: baseURLString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            if let error = error {
                DispatchQueue.main.async{
                    self.errorMessage = "Error fetching data"
                    
                }
                return
            }
            
            guard data != nil else{
                self.errorMessage = "No Data"
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(WeatherData.self, from: data!)
                
                DispatchQueue.main.async {
                    
                    self.weatherData = decodedData
                }
                
            }
            catch{
                
                DispatchQueue.main.async{
                    self.errorMessage = "Failed to parse through data"
                }
                
            }
            
            
        }.resume()
   
    
        
    }

    //generates insight string based on the values of the current weather conditions
    func generateInsight() -> String {

        guard let temp = weatherData?.main.temp,
            let humid = weatherData?.main.humidity,
            let wind = weatherData?.wind.speed else{
                return InsightsViewModel.insights["default"]
            }

            if temp < 20.0 {
                
                return InsightsViewModel.insights["lowTemp"]
                
            }
            
            else if humid <= 30{
                return InsightsViewModel.insights["lowHumid"]
            }


            else if wind < 5 {
                return InsightsViewModel.insights["lowWind"]
            }
            
            
            else if humid > 30 && humid <= 50{
                return InsightsViewModel.insights["midHumid"]
            }
            
            
            else if temp >= 20.0 && temp < 60.0 {
                
                return InsightsViewModel.insights["midTemp"]
                
            }
            else if temp >= 60.0 && temp < 80.0{
                
                return InsightsViewModel.insights["highTemp"]
                        
                        
                }
            
            else if wind >= 5 && wind < 15 {
                return InsightsViewModel.insights["midWind"]
            }
            else if humid > 50 {
                return InsightsViewModel.insights["highHumid"]
            }
            
            else if temp >= 80.0{
                
                return InsightsViewModel.insights["xhighTemp"]
                        
                        
                }
            
            else if wind >= 15{
                return InsightsViewModel.insights["highWind"]
            }
      
    }
    
}
