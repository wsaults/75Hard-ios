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
    var day: Day
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading) {
                HStack {
                    Text("Day \(day.number)").font(.largeTitle)
                }
                HStack() {
                    Text("You've got this!").font(.subheadline)
                    Spacer()
                    Text(day.date.description).font(.subheadline)
                }
            }
            .padding(.bottom)
            
            RequirementRow(items: requirementData)
            
            HStack() {
                Spacer()
                Button(action: { self.showingRules.toggle() }) {
                    Image(systemName: "info.circle")
                        .imageScale(.large)
                        .foregroundColor(.black)
                        .accessibility(label: Text("Rules"))
                        .padding()
                }
            }
            .padding(.top)
        }
        .padding()
        .navigationBarTitle(Text("75HARD"), displayMode: .inline)
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
        DayView(day: Day(number: 1, date: Date(), areRequirementsMet: false))
    }
}
