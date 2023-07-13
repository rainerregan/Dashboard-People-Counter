//
//  ContentView.swift
//  Dashboard People Counter
//
//  Created by Rainer Regan on 13/07/23.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase
import Charts

struct ContentView: View {
    @State var countData : [CountDataModel] = []
    @EnvironmentObject var delegate: FirebaseConnection
    
    func updateData(snapshot: DataSnapshot?) {
        guard let value = snapshot?.value as? [String: Any] else {return}
        
        let count = value["person_count"] as! Int
        let lastUpdated = value["last_updated"] as! Double
        
        let data = CountDataModel(count: count, lastUpdated: Date(timeIntervalSince1970: lastUpdated))
        countData.append(data)
    }
    
    var body: some View {
        VStack {
            Text("Realtime People Count")
                .font(.title)
            
            HStack{
                VStack{
                    Text("Current Capacity: \(String(countData.last?.count ?? 0))")
                        .font(.title2)
                }
            }
            .padding(.vertical, 16)
            
            Chart {
                ForEach(countData) { data in
                    LineMark(
                        x: .value("Timestamp", data.lastUpdated),
                        y: .value("Total People Detected", data.count)
                    )
                }
            }
            .frame(height: 300)
        }
        .padding()
        .onAppear{
            delegate.getCounterData(completion: updateData)
        }
    }
}
