//
//  ContentView.swift
//  Dashboard People Counter
//
//  Created by Rainer Regan on 13/07/23.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase

struct ContentView: View {
    @State var peopleCount : [Int] = []
    @EnvironmentObject var delegate: FirebaseConnection
    
    func updateData(snapshot: DataSnapshot?) {
//        self.peopleCount = snapshot?.value as Int
        guard let value = snapshot?.value as? [String: Any] else {return}
        let count = value.first!.1 as! Int
        peopleCount.append(count)
    }
    
    var body: some View {
        VStack {
            Text("Realtime People Count")
//            Text(peopleCount != nil ? String(peopleCount!) : "Loading...")
            HStack{
                ForEach(self.peopleCount, id: \.self) { data in
                    Text(String(data))
                }
            }
        }
        .padding()
        .onAppear{
            delegate.getCounterData(completion: updateData)
        }
    }
}
