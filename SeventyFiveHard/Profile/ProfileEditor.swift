//
//  ProfileEditor.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI


struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Current Day").bold()
                
                Picker(selection: $profile.currentDay, label: Text("")) {
                    ForEach(1 ... profile.maxDays, id: \.self) { i in
                        Text("\(i)")
                   }
                }.padding(.top, -60)
            }.padding(.top)
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Goal Date").bold()
                DatePicker(
                    "Goal Date",
                    selection: $profile.goalDate,
                    in: dateRange,
                    displayedComponents: .date)
            }
            .padding(.top)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
