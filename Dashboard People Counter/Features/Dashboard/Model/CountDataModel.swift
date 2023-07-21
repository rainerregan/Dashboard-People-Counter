//
//  CountDataModel.swift
//  Dashboard People Counter
//
//  Created by Rainer Regan on 13/07/23.
//

import Foundation

class CountDataModel: Hashable, Identifiable {
    let id = UUID()
    let count: Int
    let lastUpdated: Date
    let outsideTemperature: Double
    
    static func == (lhs: CountDataModel, rhs: CountDataModel) -> Bool {
        return lhs.count == rhs.count && lhs.lastUpdated == rhs.lastUpdated
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    init(count: Int, lastUpdated: Date, outsideTemperature: Double = 35) {
        self.count = count
        self.lastUpdated = lastUpdated
        self.outsideTemperature = outsideTemperature
    }
    
    func calculateOptimalTemperature() -> Double{
//        var result : Double
//
//        switch self.count {
//        case _ where self.count < 60:
//            result = (0.369 * outsideTemperature) - (0.06 * Double(self.count)) + 16.004
//            break;
//        case _ where self.count >= 60 && self.count < 176:
//            result = (0.303 * outsideTemperature) - (0.011 * Double(self.count)) + 15.791
//            break;
//        default:
//            result = -1.0
//            break;
//        }
        
        var result = (0.303 * outsideTemperature) - (0.011 * Double(self.count)) + 15.791
        // 12,177 - 0,36 + 16.004
        return result
    }
    
    func calculateOptimalAirFlowOutput() -> Double {
        // -138,24 + 2409,6 + 988,4
        var section1 = -0.06 * pow(Double(self.count), 2)
        var section2 = (50.2 * Double(self.count))
        var result : Double = section1 + section2 + 988.4
        return result
    }
    
    func calculateOptimalFanSpeed() -> Double {
        return calculateOptimalAirFlowOutput() / 8000 * 100
    }
}
