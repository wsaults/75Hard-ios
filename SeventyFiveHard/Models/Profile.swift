/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores user profile data.
*/

import Foundation

struct Profile {
    let maxDays = 75
    
    var days: [Day]
    
    var currentDay: Int {
        didSet {
            UserDefaults.standard.set(currentDay, forKey: "currentDay")
            days = Helpers.resetDaysForCurrentDay(days: days, number: currentDay)
        }
    }
    
    static let `default` = Self(prefersNotifications: true)
    
    init(prefersNotifications: Bool = true) {
        self.currentDay = UserDefaults.standard.object(forKey: "currentDay") as? Int ?? 1
        self.days = Helpers.createDays()
    }
}
