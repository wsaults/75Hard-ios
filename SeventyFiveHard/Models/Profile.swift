/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores user profile data.
*/

import Foundation

struct TempProfile {
    let maxDays = 75
    var days: [Day]
    
    var currentDay: Int {
        didSet {
            valuesChaned = true
        }
    }
    
    var progressDay: Int {
        didSet {
            valuesChaned = true
        }
    }
    
    fileprivate var valuesChaned = false
    
    static let `default` = Self(currentDay: 1, progressDay: 1, days: [Day.default])
    
    func needsUpdate() -> Bool {
        return valuesChaned
    }
    
    init(currentDay: Int, progressDay: Int, days: [Day]) {
        self.currentDay = currentDay
        self.days = days
        self.progressDay = progressDay
        self.valuesChaned = false
    }
}

struct Profile {
    let maxDays = 75
    
    var days: [Day]
    
    var currentDate: Date {
        set {
            UserDefaults.standard.set(newValue, forKey: "currentDate")
        }
        
        get {
            return UserDefaults.standard.object(forKey: "currentDate") as? Date ?? Date()
        }
    }
    
    var currentDay: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: "currentDay")
        }
        
        get {
            return UserDefaults.standard.object(forKey: "currentDay") as? Int ?? 1
        }
    }
    
    var progressDay: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: "progressDay")
            resetDaysTo(day: newValue)   
        }
        
        get {
            return UserDefaults.standard.object(forKey: "progressDay") as? Int ?? 1
        }
    }
    
    static let `default` = Self()
    
    init() {
        self.days = Helpers.createDays()
    }
    
    private mutating func resetDaysTo(day: Int) {
        currentDay = day
        days = Helpers.resetDaysForCurrentDay(days: days, number: day)
        currentDate = Date()
    }
}
