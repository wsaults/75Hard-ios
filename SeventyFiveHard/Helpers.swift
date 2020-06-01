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
            days.append(Day(number: n, date: Date(), areRequirementsMet: false))
        }
        return days
    }
}
