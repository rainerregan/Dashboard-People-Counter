//
//  TrainDetailView.swift
//  TryMacOS
//
//  Created by ndyyy on 19/07/23.
//

import SwiftUI

struct TrainDetailView: View {
    var body: some View {
        VStack {
            Image("MRT-Banner")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 108, alignment: .center)
                       
            //MARK: Train Name
            VStack(alignment: .leading) {
                Text("Going to Lebak Bulus")
                    .font(.SFProDisplay(.custom24))
                
                Text("Train Number 9")
                    .font(.SFProDisplay(.custom42))
            }
//            .foregroundColor(.App.mainBlue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 150)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct TrainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TrainDetailView()
    }
}
