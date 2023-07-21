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
        ScrollView{
            VStack {
//                Button("Speech") {
//
//
//                        // TTS
//                        let utterance = AVSpeechUtterance(string: "Hello")
//                        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
//                    utterance.rate = 0.5
//
//                    synthesizer = AVSpeechSynthesizer()
//                        synthesizer.speak(utterance)
//                }
                VStack(alignment: .leading) {
                    //MARK: Banner
                    Image("MRT-Banner")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                    
                    // MARK: VStack Dalam
                    VStack(alignment: .leading) {
                        //MARK: -Carriage Information
                        VStack(alignment: .leading) {
                            Text("Bound for Lebak Bulus")
                                .font(.SFProDisplay(.custom24))
                            Text("MRT - 1079")
                                .font(.SFProDisplay(.custom42))
                                .bold()
                        }
                
                        
                        //MARK: -Carriage Image
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
                        
                        // MARK: - Train Detail
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("For the Best Thermal Comfort")
                                    .font(.SFProDisplay(.custom24))
                                    .bold()
                                
                                HStack{
                                    VStack(alignment: .leading) {
                                        Text("Temperature")
                                            .font(.SFProDisplay(.custom24))
                                            .fontWeight(.semibold)
                                        
                                        HStack {
                                            Image(systemName: "thermometer.medium")
                                                .foregroundColor(.green)
                                                .font(.SFProDisplay(.custom75))
                                            HStack(alignment: .bottom, spacing: 0) {
                                                Text("\((homeVM.carsData["camera_1"]?.data.last?.calculateOptimalTemperature() ?? 23).toFormattedString())")
                                                    .font(.SFProDisplay(.custom96))
                                                Text("˚C")
                                                    .font(.SFProDisplay(.custom64))
                                            }
                                            .fontWeight(.heavy)
                                            
                                        }
                                    }
                                    Spacer()
                                    //MARK: Fan Speed
                                    VStack(alignment: .leading) {
                                        Text("Fan Speed")
                                            .font(.SFProDisplay(.custom24))
                                            .fontWeight(.semibold)
                                        
                                        HStack {
                                            Image(systemName: "wind")
                                                .foregroundColor(.green)
                                                .font(.SFProDisplay(.custom75))
                                            Text("\((homeVM.carsData["camera_1"]?.data.last?.calculateOptimalFanSpeed() ?? 0).toFormattedString())%")
                                                .font(.SFProDisplay(.custom96))
                                        }
                                        .fontWeight(.heavy)
                                    }
                                }
                                .padding(32)
                                .background(.white)
                                .cornerRadius(20)
                                
                                Spacer()
                                    .frame(height: 16)
                                
                                HStack(alignment: .top) {
                                    VStack(alignment:.leading) {
                                        Text("Current Car Condition")
                                            .font(.SFProDisplay(.custom24))
                                            .fontWeight(.bold)
                                        
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text("Mass Crowd")
                                                    .fontWeight(.semibold)
                                                    .font(.SFProDisplay(.custom12))
                                                
                                                HStack(spacing: 0) {
                                                    Image(systemName: "person.2.fill")
                                                        .foregroundColor(.blue)
                                                        .font(.SFProDisplay(.custom24))
                                                    
                                                    Text("\(homeVM.carsData["camera_1"]?.data.last?.count ?? -1)")
                                                        .font(.SFProDisplay(.custom32))
                                                        .fontWeight(.bold)
                                                }
                                                Text("of 189")
                                                    .font(.SFProDisplay(.custom12))
                                                
                                            }
                                            
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 32)
                                        .padding(.vertical, 16)
                                        .background(.white)
                                        .cornerRadius(20)
                                    }
                                    
                                    Spacer()
                                        .frame(width: 16)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Weather")
                                            .font(.SFProDisplay(.custom24))
                                            .fontWeight(.bold)
                                        HStack(alignment: .top) {
                                            VStack(alignment: .leading) {
                                                Text("Weather")
                                                    .fontWeight(.semibold)
                                                    .font(.SFProDisplay(.custom12))
                                                
                                                HStack {
                                                    Image(systemName: "sun.min")
                                                        .foregroundColor(.orange)
                                                        .font(.SFProDisplay(.custom24))
                                                    
                                                    Text(homeVM.trainDetail.weatherStatus)
                                                        .font(.SFProDisplay(.custom32))
                                                        .fontWeight(.bold)
                                                }
                                                Text(homeVM.trainDetail.chanceOfRain)
                                                    .font(.SFProDisplay(.custom12))
                                                
                                            }
                                            Spacer()
                                            VStack(alignment: .leading) {
                                                Text("Environment Temperature")
                                                    .fontWeight(.semibold)
                                                    .font(.SFProDisplay(.custom12))
                                                
                                                HStack (spacing: 0) {
                                                    Image(systemName: "thermometer.medium")
                                                        .foregroundColor(.orange)
                                                        .font(.SFProDisplay(.custom24))
                                                    
                                                    Text(("\((homeVM.carsData["camera_1"]?.data.last?.outsideTemperature ?? 35).toFormattedString())˚C"))
                                                        .font(.SFProDisplay(.custom32))
                                                        .fontWeight(.bold)
                                                }
                                                
                                            }
                                        }
                                        .padding(.horizontal, 32)
                                        .padding(.vertical, 16)
                                            .background(.white)
                                            .cornerRadius(20)
                                    }
                                }
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer(minLength: 20)
                            
                            // MARK: - Live View
                            VStack(alignment: .leading){
                                Text("Live View")
                                    .font(.SFProDisplay(.custom24))
                                    .bold()
                                VStack {
                                    VStack() {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.gray)
                                            .frame(height: 150)
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.gray)
                                            .frame(height: 150)
                                        
                                    }
                                    .frame(maxHeight: .infinity, alignment: .top)
                                }
                                .padding(16)
                                .background(.white)
                                .cornerRadius(20)
                            }
                            .frame(width: 240, alignment: .leading)
                        }
                        .padding(.vertical, 16)
                        
                    }
                    .padding(.horizontal, 100)
                    .padding(.vertical, 16)
                }
        
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
