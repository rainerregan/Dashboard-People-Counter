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
                .scaledToFit()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct TrainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TrainDetailView()
    }
}


/*
 AngularGradient(gradient: Gradient(colors: [Color("Angular-Tosca"),
                                             Color("Angular-Green"),
                                             Color("Angular-Orange"),
                                             Color("Angular-Orange")]), center: .zero, angle: .degrees(270+45))
 
 
 
 
          ZStack {
              Image("ColorfullBG")
                  .resizable()
                  .scaledToFill()
                  .frame(maxWidth: screen.width, maxHeight: 700, alignment: .top)
                  .padding(.bottom, 90)

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

 
 */
