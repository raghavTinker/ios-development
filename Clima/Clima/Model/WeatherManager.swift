//
//  WeatherManager.swift
//  Clima
//
//  Created by Raghav Sharma on 15/05/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

/*
Networking
 a)Create url
 b)Create a URLSession
 c)Give URLSession a task
 d)start a task
*/
import Foundation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}
struct WeatherManager{
    var delegate: WeatherManagerDelegate?
    let weatherURL: String = "https://api.openweathermap.org/data/2.5/weather?appid=b4c0912e6bccd41853bde0210fd62147&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //Step 1
        if let url = URL(string: urlString){
            //Step 2
            let session = URLSession(configuration: .default)
            
            //Step 3
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = self.parseJSON(weatherData: safeData){
                        self.delegate?.didUpdateWeather(self,weather: weather)
                    }
                }
            }
            //CompletiionHandler: Takes a function as a value
            
            //Step4
            task.resume()
        }
        
    }
    
    
    func parseJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name , temperature: temp)
            return weather
        }
        catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    

}

/*
    JSON: Javascript object notation
 
 Javascript: var wardrobe = {
    doors: 2
 */
