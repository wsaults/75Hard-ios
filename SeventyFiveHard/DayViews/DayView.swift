//
//  DayView.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct DayView: View {
    @State var showingRules = false
    
    var currentDay: Int
    @Binding var day: Day
    fileprivate var items: [Requirement]  {
        requirementData
    }
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading) {
                HStack {
                    Text("Day \(day.number)")
                        .foregroundColor(currentDay == day.number ? Color(UIColor.systemIndigo) : .primary)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Button(action: { self.showingRules.toggle() }) {
                        Image(systemName: "exclamationmark.shield")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                            .accessibility(label: Text("Rules"))
                            .padding()
                    }
                }
                HStack() {
                    Text("You've got this!").font(.callout)
                        .padding(.top, -10)
                    Spacer()
                }
            }
            .padding(.leading)
            
            VStack(spacing: 0) {
                ForEach(items, id: \.id) { item in
                    RequirementItemRow(requirement: item, day: self.$day)
                }
            }
        }
        .padding(.top)
        .sheet(isPresented: $showingRules) {
            VStack(alignment: .leading) {
                Text("🛌 You have until you go to sleep to complete the day")
                Text("🚫 No alcohol or cheat meals")
                Text("🌦 1 of your workouts MUST be outdoors")
                Text("🔇 Audio books DO NOT count")
                Text("💀 Start on day 1 if you fail")
            }
            .padding()
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DayView(currentDay: 1, day: .constant(Day(number: 1, date: Date(), areRequirementsMet: false)))
              .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
              .previewDisplayName("iPhone SE")


            DayView(currentDay: 1, day: .constant(Day(number: 2, date: Date(), areRequirementsMet: false)))
              .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
              .previewDisplayName("iPhone XS Max")
        }
    }
}
