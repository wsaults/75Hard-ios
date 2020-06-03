//
//  WeekDayButton.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/24/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct WeekDayButton: View {
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default
    
    var currentDay: Int
    var day: Day
    
    @State var showingDetail = false
    
    var body: some View {
        Button(action: {
            self.showingDetail.toggle()
        }) {
            Circle()
                .stroke(currentDay == day.number ? Color(UIColor.systemIndigo) : .clear, lineWidth: 2)
            .frame(width: 35, height: 35)
            .overlay(
                Circle()
                    .fill(day.areRequirementsMet() ? Color(UIColor.systemIndigo) : Color(UIColor.secondarySystemFill))
                .overlay(
                    Text("\(day.number)")
                    .fontWeight(.light)
                        .foregroundColor(day.areRequirementsMet() ? Color(UIColor.white) : Color(UIColor.label))
                )
            )
        }
        .accessibility(label: Text("Day \(day.number)"))
        .sheet(isPresented: $showingDetail) {
            DayView(currentDay: self.currentDay, day: self.$draftProfile.days[self.day.number-1])
            .onAppear {
                self.draftProfile = self.userData.profile
            }
            .onDisappear {
                self.userData.profile = self.draftProfile
            }
        }
    }
}

struct WeekDayButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeekDayButton(currentDay: 1, day: Day(number: 1, date: Date())).environmentObject(UserData())
            WeekDayButton(currentDay: 1, day: Day(number: 1, date: Date())).environmentObject(UserData())
            
            WeekDayButton(currentDay: 2, day: Day(number: 1, date: Date())).environmentObject(UserData())
            WeekDayButton(currentDay: 2, day: Day(number: 1, date: Date())).environmentObject(UserData())
            
        }.previewLayout(.sizeThatFits)
    }
}
