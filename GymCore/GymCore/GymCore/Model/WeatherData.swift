//
//  NutritionData.swift
//  GymCore
//
//  Created by Teodor Radu on 07.05.2022.
//

import Foundation

struct WeatherData : Decodable{
    let name : String
    let main : Main
    let weather: [Weather]
     
}

struct Main: Decodable{
    let temp: Double
    
}

struct Weather: Decodable{
    
    let description: String
   
}
