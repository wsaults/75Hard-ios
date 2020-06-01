////
////  ContentView.swift
////  SeventyFiveHard
////
////  Created by Will Saults on 5/7/20.
////  Copyright © 2020 Will Saults. All rights reserved.
////
//
//import SwiftUI
//import MapKit
//
//struct ContentView: View {
//    @EnvironmentObject var userData: UserData
//    var day: Day
//
//    var dayIndex: Int {
//        userData.days.firstIndex(where: { $0.id == day.id })!
//    }
//
//    var body: some View {
//        VStack {
//            MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868))
//                .frame(height: 300)
//                .edgesIgnoringSafeArea(.top)
//
//            CircleImage(image: Image("150"))
//                .offset(y: -130)
//                .padding(.bottom, -130)
//            
//            VStack(alignment: .leading) {
//                HStack {
//                    Text(day.name)
//                        .font(.title)
//
//                    Button(action: {
//                        self.userData.days[self.dayIndex].isRequirementMet.toggle()
//                    }) {
//                        if self.userData.days[self.dayIndex].isRequirementMet {
//                            Image(systemName: "star.fill")
//                                .foregroundColor(.yellow)
//                        } else {
//                            Image(systemName: "star")
//                                .foregroundColor(.gray)
//                        }
//                    }
//                }
//                HStack {
//                    Text(/*@START_MENU_TOKEN@*/"Something new"/*@END_MENU_TOKEN@*/)
//                        .font(.subheadline)
//                    Spacer()
//                    Text("Follow")
//                        .font(.subheadline)
//                }
//            }
//            .padding()
//
//            Spacer()
//        }
//        .navigationBarTitle(Text(day.name), displayMode: .inline)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(day: dayData[0])
//            .environmentObject(UserData())
//    }
//}
