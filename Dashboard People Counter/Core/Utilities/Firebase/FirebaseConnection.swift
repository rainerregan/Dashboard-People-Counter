//
//  Storage.swift
//  PersonCounterIOS
//
//  Created by Rainer Regan on 13/07/23.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabase

class FirebaseConnection: NSObject, ObservableObject {
    override init() {
        super.init()
        self.connectFirebase()
    }
    
    func connectFirebase() {
        FirebaseApp.configure()
        print("Firebase connected")
    }
    
    func getCounterData(car_id: String, completion: @escaping (DataSnapshot?) -> Void){
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child(car_id).observe(DataEventType.value, with: completion)
    }
}
