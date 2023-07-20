//
//  TrainDetailView.swift
//  TryMacOS
//
//  Created by ndyyy on 19/07/23.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var homeVM: HomeViewModel

    var body: some View {
        VStack {
            //MARK: Banner
            VStack(alignment: .leading) {
                Image("MRT-Banner")
                    .resizable()
                    .scaledToFit()
            }
            .frame(maxWidth: .infinity)
            
            //MARK: Carriage Information
            VStack {
                Text("Bound for Lebak Bulus")
                    .font(.SFProDisplay(.custom24))
                Text("MRT - 1 0 7 9")
                    .font(.SFProDisplay(.custom42))

                //MARK: Carriage Image
                HStack {
                    ForEach(homeVM.dummyData, id: \.id) { train in
                        //MARK: Train Detail View
                        VStack {
                            Image("Car\(train.carId)")
                                .resizable()
                                .frame(width: 166, height: 80)
                        }
                        .onTapGesture {
                            print("\(train.carId) clicked")
                        }

                    }
                }
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 137)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
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
