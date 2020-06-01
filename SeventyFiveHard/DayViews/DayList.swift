//
//  DayList.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct DayList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
//        List {
            Toggle(isOn: $userData.showRequirementsMetOnly) {
                Text("Show Requirements Met only")
            }
            
//            ForEach(userData.days) { day in
//                if !self.userData.showRequirementsMetOnly || day.isRequirementMet {
//                    NavigationLink(destination: ContentView(day: day)
//                        .environmentObject(self.userData)
//                    ) {
//                        Row(day: day)
//                    }
//                }
//            }
//        }
//        .navigationBarTitle("Days")
    }
}

struct DayList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DayList()
                .environmentObject(UserData())
        }
    }
}
