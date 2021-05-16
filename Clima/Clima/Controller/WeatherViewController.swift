//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation //Location detection through GPS etc.

class WeatherViewController: UIViewController{

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager: WeatherManager = WeatherManager()
    let locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        searchTextField.delegate = self //the text field should report to the view controller
        weatherManager.delegate = self //Tells the view controller when the person starts typing or stops typing
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        //locationManager.startUpdatingLocation() for continuous tracking for a maps app or a running app
    }
    
    @IBAction func refreshLocation(_ sender: Any) {
        locationManager.requestLocation()
    }
}

//MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            locationManager.stopUpdatingLocation() //so that the manager stops So explicit call will update the location
            weatherManager.fetchWeather(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error!")
    }
}



//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate{
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //In all delegate members you can change the properties of the searchTextField as textField
        /*
            if textField.text != ""{
                return true
            }
         */
        
        //The above is same as below
        if searchTextField.text != ""{
            return true
        }
        else{
            searchTextField.placeholder = "Type something"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: removeSpace(cityName: city))
        }
        searchTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    func removeSpace(cityName: String) -> String{
        return cityName.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
    }

}


//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        //cityLabel.text = weather.cityName This wont work
        //As the networking activity is in the background so we have to use the completion handler for updating ui elements
        DispatchQueue.main.async{
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

