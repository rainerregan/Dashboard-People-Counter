//
//  TrainModel.swift
//  Dashboard People Counter
//
//  Created by Rainer Regan on 21/07/23.
//

import Foundation

struct CarDataModel: Identifiable {
    init(id: UUID = UUID(), data: [CountDataModel] = []) {
        self.id = id
        self.data = data
    }
    
    var id: UUID = UUID()
    var data: [CountDataModel];
    
    
}
