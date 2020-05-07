//
//  DayView.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct DayView: View {
    var body: some View {
        VStack() {
            VStack(alignment: .leading) {
                HStack {
                    Text("Day 1").font(.title)
                }
                HStack() {
                    Text("You've got this!").font(.subheadline)
                    Spacer()
                    Text("5/7/2020").font(.subheadline)
                }
                Spacer()
            }
            .padding()
            
            RequirementRow(label: "🥦 Follow a diet")
            RequirementRow(label: "💪🏻 2x 45 Min workous")
            RequirementRow(label: "💧 1 gallon of water")
            RequirementRow(label: "📖 10 pages of reading")
            RequirementRow(label: "📸 Take a progress picture")
            
            VStack(alignment: .leading) {
                Text("🛌 You have until you go to sleep to complete the day")
                Text("🚫 No alcohol or cheat meals")
                Text("🌦 1 of your workouts MUST be outdoors")
                Text("🔇 Audio books DO NOT count")
                Text("💀 Start on day 1 if you fail")
            }
        }
        .padding()
        .navigationBarTitle(Text("Something"), displayMode: .inline)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
    }
}
