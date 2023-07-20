//
//  TrainModel.swift
//  TryMacOS
//
//  Created by ndyyy on 20/07/23.
//

import Foundation

struct MockTrainModel: Identifiable {
    var id = UUID()
    var trainID: Int
    var carId: Int
    var currTemp: Int
    var fanSpeed: Int
    var currPassenger: Int
    var optTemp: Int
    var weatherStatus: String
    var chanceOfRain: String
    
    init(carID: Int, trainID: Int, currTemp: Int, fanSpeed: Int, currPassenger: Int, optTemp: Int, weatherStatus: String, chanceOfRain: String) {
        self.carId = carID
        self.currTemp = currTemp
        self.fanSpeed = fanSpeed
        self.currPassenger = currPassenger
        self.optTemp = optTemp
        self.weatherStatus = weatherStatus
        self.chanceOfRain = chanceOfRain
        self.trainID = trainID
    }
    
}
