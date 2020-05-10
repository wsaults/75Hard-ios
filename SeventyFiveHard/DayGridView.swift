//
//  DayGridView.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/10/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct DayGridView: View {
    var days: [Day]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                ForEach((0...6), id: \.self) { index in
                    dayButton(day: self.days[index])
                }
            }
            HStack() {
                ForEach((7...13), id: \.self) { index in
                    dayButton(day: self.days[index])
                }
            }
            if days.count > 13 {
                HStack() {
                    ForEach((14...20), id: \.self) { index in
                        dayButton(day: self.days[index])
                    }
                }
                HStack() {
                    ForEach((21...27), id: \.self) { index in
                        dayButton(day: self.days[index])
                    }
                }
                HStack() {
                    ForEach((28...34), id: \.self) { index in
                        dayButton(day: self.days[index])
                    }
                }
                HStack() {
                    ForEach((35...41), id: \.self) { index in
                        dayButton(day: self.days[index])
                    }
                }
                HStack() {
                    ForEach((42...48), id: \.self) { index in
                        dayButton(day: self.days[index])
                    }
                }
                HStack() {
                    ForEach((49...55), id: \.self) { index in
                        dayButton(day: self.days[index])
                    }
                }
                HStack() {
                    ForEach((56...62), id: \.self) { index in
                        dayButton(day: self.days[index])
                    }
                }
                HStack() {
                    ForEach((63...69), id: \.self) { index in
                        dayButton(day: self.days[index])
                    }
                }
                HStack() {
                    ForEach((70...74), id: \.self) { index in
                        dayButton(day: self.days[index])
                    }
                }
            }
        }
    }
}

struct dayButton: View {
    var day: Day
    @State var isComplete = false
    
    var body: some View {
        Button(action: {
            self.isComplete.toggle()
        }) {
            if isComplete {
                RoundedRectangle(cornerRadius: 22)
                .fill(Color.green)
                .frame(width: 44, height: 44)
                .overlay(
                    Text("\(day.number)")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.white)
                )
            } else {
                RoundedRectangle(cornerRadius: 22)
                .stroke(Color.primary, lineWidth: 2)
                .frame(width: 44, height: 44)
                .overlay(
                    Text("\(day.number)")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.primary)
                )
            }
        }
        .accessibility(label: Text("Day \(day.number)"))
        .frame(width: 44, height: 44)
        .padding(.bottom, 8)
        .padding(.trailing, 4)
    }
}

struct DayGridView_Previews: PreviewProvider {
    static var previews: some View {
        DayGridView(days: [
            Day(number: 1, date: Date(), areRequirementsMet: false),
            Day(number: 2, date: Date(), areRequirementsMet: false),
            Day(number: 3, date: Date(), areRequirementsMet: false),
            Day(number: 4, date: Date(), areRequirementsMet: false),
            Day(number: 5, date: Date(), areRequirementsMet: false),
            Day(number: 6, date: Date(), areRequirementsMet: false),
            Day(number: 7, date: Date(), areRequirementsMet: false),
            Day(number: 8, date: Date(), areRequirementsMet: false),
            Day(number: 9, date: Date(), areRequirementsMet: false),
            Day(number: 10, date: Date(), areRequirementsMet: false),
            Day(number: 11, date: Date(), areRequirementsMet: false),
            Day(number: 12, date: Date(), areRequirementsMet: false),
            Day(number: 13, date: Date(), areRequirementsMet: false),
            Day(number: 14, date: Date(), areRequirementsMet: false)]
        )
    }
}
