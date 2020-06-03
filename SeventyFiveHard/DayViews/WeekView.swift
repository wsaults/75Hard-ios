//
//  WeekView.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/24/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct WeekView: View {
    @EnvironmentObject var userData: UserData
    
    let current: Int
    let days: [Day]
    
    var body: some View {
        HStack() {
            ForEach(days, id: \.number) { day in
                WeekDayButton(currentDay: self.current, day: day).environmentObject(self.userData)
            }
            .padding(.top, 4)
            .padding(.trailing, 4)
        }
        .padding(.leading, 2)
        .padding(.trailing, 2)
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        let days = [
            Day(number: 70, date: Date()),
            Day(number: 71, date: Date()),
            Day(number: 72, date: Date()),
        ]
        
        return WeekView(current: 71, days: days)
            .environmentObject(UserData())
            .previewLayout(.fixed(width: 200, height: 100))
    }
}
