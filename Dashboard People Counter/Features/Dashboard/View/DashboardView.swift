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
            VStack(alignment: .leading) {
                Text("Bound for Lebak Bulus")
                    .font(.SFProDisplay(.custom24))
                Text("MRT - 1 0 7 9")
                    .font(.SFProDisplay(.custom42))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 137)
            
            
            //MARK: Carriage Image
            HStack {
                ForEach(homeVM.dummyData, id: \.id) { train in
                    VStack {
                        Image("Car\(train.carId)")
                            .resizable()
                            .frame(width: 166, height: 80)
                    }
                    .onTapGesture {
                        homeVM.trainDetail = train
                    }
                }
            }
            
            
            //MARK: Train Detail View
            VStack(alignment: .leading) {
                Text("For the best thermal comfort")
                    .font(.SFProDisplay(.custom32))
                    .bold()
                HStack {
                    //MARK: Left Detail Side
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            //MARK: Temprature & Fan Speed (TOP SIDE)
                            HStack {
                                //MARK: Temprature
                                VStack(alignment: .leading) {
                                    Text("Temperature")
                                        .font(.SFProDisplay(.custom32))
                                        .fontWeight(.semibold)
                                    
                                    HStack {
                                        Image(systemName: "thermometer.medium")
                                            .foregroundColor(.green)
                                            .font(.SFProDisplay(.custom75))
                                        HStack(alignment: .bottom, spacing: 0) {
                                            Text("\(homeVM.trainDetail.currTemp)")
                                                .font(.SFProDisplay(.custom96))
                                            Text("˚C")
                                                .font(.SFProDisplay(.custom64))
                                        }
                                        .fontWeight(.heavy)
                                        
                                    }
                                }
                                .padding(.trailing, 150)
                                .padding(.leading, 30)
                                
                                //MARK: Fan Speed
                                VStack(alignment: .leading) {
                                    Text("Fan Speed")
                                        .font(.SFProDisplay(.custom32))
                                        .fontWeight(.semibold)
                                    
                                    HStack {
                                        Image(systemName: "wind")
                                            .foregroundColor(.green)
                                            .font(.SFProDisplay(.custom75))
                                        Text("\(homeVM.trainDetail.fanSpeed)%")
                                            .font(.SFProDisplay(.custom96))
                                    }
                                    .fontWeight(.heavy)
                                }
                            }
                            .frame(width: 940, alignment: .leading)
                            .background(.gray.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.bottom, 30)
                            
                            //MARK: Current Car Condition & Weather (BOTTOM SIDE)
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Current Car Condition")
                                        .font(.SFProDisplay(.custom24))
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 30)
                                    
                                    //MARK: Mass Crowd & Outside Temperature
                                    HStack(alignment: .top) {
                                        //MARK: Mass Crowd
                                        VStack(alignment: .leading) {
                                            Text("Mass Crowd")
                                                .fontWeight(.semibold)
                                                .font(.SFProDisplay(.custom24))
                                            
                                            HStack {
                                                Image(systemName: "person.2.fill")
                                                    .foregroundColor(.green)
                                                    .font(.SFProDisplay(.custom32))
                                                
                                                Text("\(homeVM.trainDetail.currPassenger)")
                                                    .font(.SFProDisplay(.custom24))
                                                    .fontWeight(.bold)
                                            }
                                            Text("of 189")
                                                .font(.SFProDisplay(.custom24))
                                            
                                        }
                                        .padding(.trailing, 40)
                                        
                                        //MARK: Outside Temperature
                                        VStack(alignment: .leading) {
                                            Text("Outside Temperature")
                                                .font(.SFProDisplay(.custom24))
                                                .fontWeight(.semibold)
                                            
                                            HStack {
                                                Image(systemName: "thermometer.medium")
                                                    .foregroundColor(.green)
                                                    .font(.SFProDisplay(.custom24))
                                                
                                                Text("\(homeVM.trainDetail.currTemp) ˚C")
                                                    .font(.SFProDisplay(.custom24))
                                                    .fontWeight(.bold)
                                            }
                                        }
                                    }
                                    .frame(width: 470, alignment: .leading)
                                    .background(.red)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                            
                                //MARK: Weather
                                VStack(alignment: .leading) {
                                    Text("Weather")
                                        .font(.SFProDisplay(.custom24))
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 30)
                                    
                                    //MARK: Weather
                                    VStack(alignment: .leading) {
                                        Text("Weather")
                                            .fontWeight(.semibold)
                                            .font(.SFProDisplay(.custom24))
                                        
                                        HStack {
                                            Image(systemName: "sun.min")
                                                .foregroundColor(.orange)
                                                .font(.SFProDisplay(.custom32))
                                            
                                            Text(homeVM.trainDetail.weatherStatus)
                                                .font(.SFProDisplay(.custom24))
                                                .fontWeight(.bold)
                                        }
                                        Text(homeVM.trainDetail.chanceOfRain)
                                            .font(.SFProDisplay(.custom24))
                                        
                                    }
                                    .frame(width: 470, alignment: .leading)
                                    .background(.red)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                }
                            }
                            
                        }
                    }
                    .frame(width: 980, alignment: .leading)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                    //MARK: Right Detail Side
                    VStack {
                        Text("Live View")
                        VStack {
                            VStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.gray)
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.gray)
                            }
                            .frame(width: 200, height: 400)
                        }
                        .frame(width: 250, height: 430)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
            }
            
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
