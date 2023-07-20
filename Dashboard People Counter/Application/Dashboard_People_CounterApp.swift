//
//  Dashboard_People_CounterApp.swift
//  Dashboard People Counter
//
//  Created by Rainer Regan on 13/07/23.
//

import SwiftUI

@main
struct Dashboard_People_CounterApp: App {
    @StateObject var delegate: FirebaseConnection = FirebaseConnection()
    @StateObject var homeVM = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(delegate)
            .environmentObject(homeVM)
            .preferredColorScheme(.light)
        }
    }
}
