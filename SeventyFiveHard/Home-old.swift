////
////  Home-old.swift
////  SeventyFiveHard
////
////  Created by Will Saults on 5/8/20.
////  Copyright © 2020 Will Saults. All rights reserved.
////
//
//import SwiftUI
//
//struct Home_old: View {
////    var categories: [String: [Day]] {
////        Dictionary(
////            grouping: dayData,
////            by: { $0.category.rawValue }
////        )
////    }
////
////    var featured: [Day] {
////        dayData.filter { $0.isFeatured }
////    }
//
//    @State var showingProfile = false
//    @EnvironmentObject var userData: UserData
//
//    var profileButton: some View {
//        Button(action: { self.showingProfile.toggle() }) {
//            Image(systemName: "person.crop.circle")
//                .imageScale(.large)
//                .accessibility(label: Text("User Profile"))
//                .padding()
//        }
//    }
//    
////    var body: some View {
////        NavigationView {
////            List {
////                FeaturedDays(days: featured)
////                    .scaledToFill()
////                    .frame(height: 200)
////                    .clipped()
////                    .listRowInsets(EdgeInsets())
////
////                ForEach(categories.keys.sorted(), id: \.self) { key in
////                    CategoryRow(categoryName: key, items: self.categories[key]!)
////                }
////                .listRowInsets(EdgeInsets())
////
////                NavigationLink(destination: DayList()) {
////                    Text("See All")
////                }
////            }
////            .navigationBarTitle(Text("Featured"))
////            .navigationBarItems(trailing: profileButton)
////            .sheet(isPresented: $showingProfile) {
////                ProfileHost()
////                    .environmentObject(self.userData)
////            }
////        }
////    }
//}
//
//struct FeaturedDays: View {
//    var days: [Day]
//    var body: some View {
//        Image("hiddenlake").resizable()
//    }
//}
//
//struct Home_old_Previews: PreviewProvider {
//    static var previews: some View {
//        Home_old()
//    }
//}
