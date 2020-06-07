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
            ZStack {
                if !day.areRequirementsMet() {
                    DayProgress(count: self.day.countRequirementsMet())
                }
                
                Circle()
                .stroke(currentDay == day.number ? Color.primary : .clear, lineWidth: 2)
                .overlay(
                    Circle()
                        .fill(day.areRequirementsMet() ? Color(UIColor.red75) : Color(UIColor.secondarySystemFill))
                    .overlay(
                        Text("\(day.number)")
                        .fontWeight(.light)
                            .foregroundColor(day.areRequirementsMet() ? Color(UIColor.white) : Color(UIColor.label))
                    ).frame(width: 36, height: 36)
                )
                .frame(width: 38, height: 38)
            }
        }
        .accessibility(label: Text("Day \(day.number)"))
        .sheet(isPresented: $showingDetail) {
            DayView(currentDay: self.currentDay,
                    day: self.$draftProfile.days[self.day.number-1],
                    motivationText: motivationData.randomElement()?.text ?? "You've got this!")
            .onAppear {
                self.draftProfile = self.userData.profile
            }
            .onDisappear {
                self.userData.profile = self.draftProfile
                
                let count = self.day.countRequirementsMet()
                if count == 6 {
                    StoreHelpers.askForReviewIfNeeded()
                }
            }
        }
    }
}

struct WeekDayButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeekDayButton(currentDay: 1, day: Day(number: 1)).environmentObject(UserData())
            WeekDayButton(currentDay: 1, day: Day(number: 1)).environmentObject(UserData())
            
            WeekDayButton(currentDay: 2, day: Day(number: 1)).environmentObject(UserData())
            WeekDayButton(currentDay: 2, day: Day(number: 1)).environmentObject(UserData())
            WeekDayButton(currentDay: 1, day: Day(number: 1)).environmentObject(UserData())
            WeekDayButton(currentDay: 2, day: Day(number: 1)).environmentObject(UserData())
        }
        .previewLayout(.sizeThatFits)
    }
}
