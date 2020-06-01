//
//  DayGridView.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/10/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct DayGridView: View {
    @EnvironmentObject var userData: UserData
    
    private var ranges: [Int] {
        var ranges: [Int] = []
        for day in stride(from: 0, to: userData.profile.maxDays, by: 7) {
            ranges.append(day)
        }
        return ranges
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(ranges, id: \.self) { range in
                    self.weekFromDays(start: range, end: range+6)
                }
            }.padding(.top)
        }
    }
    
    func weekFromDays(start: Int, end: Int) -> WeekView {
        var week: [Day] = []
        let days = userData.profile.days
        
        if start < 69 {
            week = Array(days[start...end])
        } else {
            week = [days[70], days[71], days[72], days[73], days[74]]
        }
        
        return WeekView(current: userData.profile.currentDay, days: week)
    }
}

struct DayGridView_Previews: PreviewProvider {
    static var previews: some View {
        DayGridView().environmentObject(UserData())
    }
}
