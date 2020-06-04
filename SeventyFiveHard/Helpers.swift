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
            days.append(Day(number: n))
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
    
    static func differenceFromCurrentDate(_ currentDate: Date) -> Int {
        let calendar = NSCalendar.current as NSCalendar

        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: currentDate)
        let date2 = calendar.startOfDay(for: Date())

        let flags = NSCalendar.Unit.day
        let components = calendar.components(flags, from: date1, to: date2, options: [])
        
        return components.day ?? 0
    }
    
    static func addDaysToDate(value: Int, date: Date) -> Date {
        return Calendar.current.date(byAdding: .day, value: value, to: date) ?? Date()
    }
}
