//
//  NutritionController.swift
//  GymCore
//
//  Created by Teodor Radu on 07.05.2022.
//

import UIKit

class RunningController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather"
   
    let apiKey = ""
    
    var finalData = ""
    
    func fetchWeather(cityName: String)
    {
        let urlString = weatherURL + "?q=" + cityName + "&appid=" + apiKey
       
        if let url = URL(string: urlString)
        {

            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url) {(data , response, error) in

                if error != nil{
                    print(error!)
                    return
                }

                if let safeData = data{
                    let decoder = JSONDecoder()

                    do {
                        var wData = try decoder.decode(WeatherData.self, from: safeData)
                    
                        self.finalData = wData.weather[0].description
                      
                    } catch
                    {
                        print(error)
                    }
                  //  return decoded
                }

            }
            task.resume()
        }

    }
    
    func fetchTemperature(lat: String,lon: String)
    {
        let urlString = weatherURL + "?lat=" + lat + "&lon=" +  lon + "&appid=" + apiKey
        print(urlString)
        if let url = URL(string: urlString)
        {

            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url) {(data , response, error) in

                if error != nil{
                    print(error!)
                    return
                }

                if let safeData = data{
                    let decoder = JSONDecoder()

                    do {
                        var wData = try decoder.decode(WeatherData.self, from: safeData)
                    
                        self.finalData = wData.weather[0].description
                      
                    } catch
                    {
                        print(error)
                    }
                  //  return decoded
                }

            }
            task.resume()
        }

    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            searchTextField.endEditing(true)
            
            print(searchTextField.text!)
            return true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
       
            if let city = searchTextField.text{
                let queryString = city.components(separatedBy: " ")
                if queryString.count == 1 {
                    fetchWeather(cityName: city)
                    temperatureLabel.text = finalData
                }else{
                    print(queryString[0])
                    print(queryString[1])
                    fetchTemperature(lat: queryString[0], lon: queryString[1])
                    temperatureLabel.text = finalData
                }

            }
            
            searchTextField.text = ""
           
        }
        
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            if textField.text != "" {
                return true
            }else
            {
                textField.placeholder = "Scrie Ceva"
                return false
            }
            
        }
    
    
}
