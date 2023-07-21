//
//  HomeViewModel.swift
//  TryMacOS
//
//  Created by ndyyy on 19/07/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
//    var screen = NSScreen.main?.frame.size
    
    @Published var dummyData = [
        MockTrainModel(carID: 1, trainID: 1, currTemp: 28, fanSpeed: 60, currPassenger: 68, optTemp: 22, weatherStatus: "Sunny", chanceOfRain: "20% chance of rain"),
        MockTrainModel(carID: 2, trainID: 1, currTemp: 29, fanSpeed: 40, currPassenger: 38, optTemp: 23, weatherStatus: "Cloudy", chanceOfRain: "30% chance of rain"),
        MockTrainModel(carID: 3, trainID: 1, currTemp: 29, fanSpeed: 80, currPassenger: 10, optTemp: 22, weatherStatus: "Rain", chanceOfRain: "80% chance of rain"),
        MockTrainModel(carID: 4, trainID: 1, currTemp: 29, fanSpeed: 100, currPassenger: 44, optTemp: 23, weatherStatus: "Rain", chanceOfRain: "80% chance of rain"),
        MockTrainModel(carID: 5, trainID: 1, currTemp: 30, fanSpeed: 20, currPassenger: 19, optTemp: 22, weatherStatus: "Rain", chanceOfRain: "90% chance of rain"),
        MockTrainModel(carID: 6, trainID: 1, currTemp: 30, fanSpeed: 40, currPassenger: 91, optTemp: 21, weatherStatus: "Rain", chanceOfRain: "100% chance of rain")
    ]
    
    @Published var trainDetail = MockTrainModel(carID: 1, trainID: 1, currTemp: 28, fanSpeed: 60, currPassenger: 68, optTemp: 22, weatherStatus: "Sunny", chanceOfRain: "20% chance of rain")
}
