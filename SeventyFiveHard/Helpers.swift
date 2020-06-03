//
//  Helpers.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/31/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import Foundation

class Helpers {
    static func createDays() -> [Day] {
        var days: [Day] = []
        for n in 1...75 {
            days.append(Day(number: n, date: Date()))
        }
        return days
    }
    
    static func resetDaysForCurrentDay(days: [Day], number: Int) -> [Day] {
        for (index, var day) in days.enumerated() {
            let areRequirementsMet = number > index + 1
            day.setAllRequirements(areRequirementsMet)
        }
        
        return days
    }
}
