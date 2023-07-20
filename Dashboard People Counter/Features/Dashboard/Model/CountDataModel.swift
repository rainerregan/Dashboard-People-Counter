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
    
    static func == (lhs: CountDataModel, rhs: CountDataModel) -> Bool {
        return lhs.count == rhs.count && lhs.lastUpdated == rhs.lastUpdated
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    init(count: Int, lastUpdated: Date) {
        self.count = count
        self.lastUpdated = lastUpdated
    }
}
