//
//  Home.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct Home: View {
    var maxDays: Int
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .foregroundColor(.black)
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(1...maxDays, id: \.self) { index in
                        DayView(day:
                            // Read this from UserDefaults
                            Day(number: index, date: Date(), areRequirementsMet: false)
                        )
                    }
                    .listRowInsets(EdgeInsets())
                }
            }
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(self.userData)
            }
//            List {
//                ForEach(categories.keys.sorted(), id: \.self) { key in
//                    CategoryRow(categoryName: key, items: self.categories[key]!)
//                }
//                .listRowInsets(EdgeInsets())
//            }
//            .navigationBarTitle(Text("Featured"))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(maxDays: 4)
    }
}
