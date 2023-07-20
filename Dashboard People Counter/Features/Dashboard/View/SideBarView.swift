//
//  SideBarView.swift
//  TryMacOS
//
//  Created by ndyyy on 19/07/23.
//

import SwiftUI

struct SideBarView: View {
    
    var body: some View {
        List {
            NavigationLink(destination: TrainDetailView()) {
               Text("Train number 1")
            }
            
            NavigationLink(destination: TrainDetailView()) {
                Text("Train number 2")
            }
        }
        .listStyle(.sidebar)
        
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
