//
//  Day.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import Foundation

struct Day {
    var number: Int
    var date: Date
    
    var isDietRequirementMet: Bool {
        didSet {
            UserDefaults.standard.set(isDietRequirementMet, forKey: "\(number)-isDietRequirementMet")
        }
    }
    
    var isWaterRequirementMet: Bool {
        didSet {
            UserDefaults.standard.set(isWaterRequirementMet, forKey: "\(number)-isWaterRequirementMet")
        }
    }
    
    var isIndoorWorkoutRequirementMet: Bool {
        didSet {
            UserDefaults.standard.set(isIndoorWorkoutRequirementMet, forKey: "\(number)-isIndoorWorkoutRequirementMet")
        }
    }
    
    var isOutdoorWorkoutRequirementMet: Bool {
        didSet {
            UserDefaults.standard.set(isOutdoorWorkoutRequirementMet, forKey: "\(number)-isOutdoorWorkoutRequirementMet")
        }
    }
    
    var isReadingRequirementMet: Bool {
        didSet {
            UserDefaults.standard.set(isReadingRequirementMet, forKey: "\(number)-isReadingRequirementMet")
        }
    }
    
    var isPictureRequirementMet: Bool {
        didSet {
            UserDefaults.standard.set(isPictureRequirementMet, forKey: "\(number)-isPictureRequirementMet")
        }
    }
    
    static let `default` = Self(number: 1, date: Date(), areRequirementsMet: false)
    
    init(number: Int, date: Date, areRequirementsMet: Bool = false) {
        self.number = number
        self.date = date
        
        self.isDietRequirementMet = UserDefaults.standard.object(forKey: "\(number)-isDietRequirementMet") as? Bool ?? false
        self.isWaterRequirementMet = UserDefaults.standard.object(forKey: "\(number)-isWaterRequirementMet") as? Bool ?? false
        self.isIndoorWorkoutRequirementMet = UserDefaults.standard.object(forKey: "\(number)-isIndoorWorkoutRequirementMet") as? Bool ?? false
        self.isOutdoorWorkoutRequirementMet = UserDefaults.standard.object(forKey: "\(number)-isOutdoorWorkoutRequirementMet") as? Bool ?? false
        self.isReadingRequirementMet = UserDefaults.standard.object(forKey: "\(number)-isReadingRequirementMet") as? Bool ?? false
        self.isPictureRequirementMet = UserDefaults.standard.object(forKey: "\(number)-isPictureRequirementMet") as? Bool ?? false
    }
    
    func areRequirementsMet() -> Bool {
        return isDietRequirementMet &&
            isWaterRequirementMet &&
            isIndoorWorkoutRequirementMet &&
            isOutdoorWorkoutRequirementMet &&
            isReadingRequirementMet &&
            isPictureRequirementMet
    }
    
    enum DayRequirement: Int {
        case diet = 1, water, indoor, outdoor, reading, picture
    }
    
    func requirementById(id: Int) -> Bool {
        switch DayRequirement(rawValue: id) {
        case .diet:
            return isDietRequirementMet
        case .water:
            return isWaterRequirementMet
        case .indoor:
            return isIndoorWorkoutRequirementMet
        case .outdoor:
            return isOutdoorWorkoutRequirementMet
        case .reading:
            return isReadingRequirementMet
        case .picture:
            return isPictureRequirementMet
        case .none:
            return false
        }
    }
    
    mutating func setRequirementById(id: Int, value: Bool) {
        switch DayRequirement(rawValue: id) {
        case .diet:
            isDietRequirementMet = value
        case .water:
            isWaterRequirementMet = value
        case .indoor:
            isIndoorWorkoutRequirementMet = value
        case .outdoor:
            isOutdoorWorkoutRequirementMet = value
        case .reading:
            isReadingRequirementMet = value
        case .picture:
            isPictureRequirementMet = value
        case .none:
            break
        }
    }
}
