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
import AVFoundation
var synthesizer : AVSpeechSynthesizer!

struct ContentView: View {
    @EnvironmentObject var homeVm: HomeViewModel
    @EnvironmentObject var delegate: FirebaseConnection
    
    func updateData(snapshot: DataSnapshot?) {
        guard let value = snapshot?.value as? [String: Any] else {return}
        
        let count = value["person_count"] as! Int
        let lastUpdated = value["last_updated"] as! Double
        
        let countData = CountDataModel(count: count, lastUpdated: Date(timeIntervalSince1970: lastUpdated))
        
        var carData = CarDataModel()
        carData.data.append(countData)
        
        // Masukkan Car data ke dalam dictionary
        homeVm.carsData["camera_1"] = carData;
        
        let utterance = AVSpeechUtterance(string: "Temperature Changed to \(countData.calculateOptimalTemperature().toFormattedString()) degree celcius")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-UK")
        utterance.rate = 0.5
        
        synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    var body: some View {
        NavigationView {
            SideBarView()
            DashboardView()
        }
        .navigationTitle("Dashboard")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: HelperFunction.toggleSideBar) {
                    Image(systemName: "sidebar.leading")
                }
            }
        }
        .onAppear{
            synthesizer = AVSpeechSynthesizer()
            delegate.getCounterData(car_id: "camera_1", completion: updateData)
        }
    }
}

/**
 
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
 
 
 */
