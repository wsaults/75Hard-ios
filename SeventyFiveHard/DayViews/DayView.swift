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
    var motivationText: String
    
    fileprivate var items: [Requirement]  {
        requirementData
    }
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading) {
                HStack {
                    Text("Day \(day.number)")
                        .foregroundColor(currentDay == day.number ? Color(UIColor.red75) : .primary)
                        .font(.largeTitle)
                        .bold()
                        .underline(currentDay == day.number)
                }
                HStack() {
                    Text(motivationText).font(.callout)
                        .padding(.top, 0)
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
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DayView(currentDay: 1, day: .constant(Day(number: 1)), motivationText: "You can do it! You know you can!")
              .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
              .previewDisplayName("iPhone SE")


            DayView(currentDay: 1, day: .constant(Day(number: 2)), motivationText: "You can do it!")
              .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
              .previewDisplayName("iPhone XS Max")
        }
    }
}
