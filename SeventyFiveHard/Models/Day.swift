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
    
    var isDietRequirementMet: Bool {
        set {
            setRequirement(newValue, forKey: "isDietRequirementMet")
        }
        
        get {
            return getRequirement(forKey: "isDietRequirementMet")
        }
    }
    
    var isWaterRequirementMet: Bool {
        set {
            setRequirement(newValue, forKey: "isWaterRequirementMet")
        }
        
        get {
            return getRequirement(forKey: "isWaterRequirementMet")
        }
    }
    
    var isIndoorWorkoutRequirementMet: Bool {
        set {
            setRequirement(newValue, forKey: "isIndoorWorkoutRequirementMet")
        }
        
        get {
            return getRequirement(forKey: "isIndoorWorkoutRequirementMet")
        }
    }
    
    var isOutdoorWorkoutRequirementMet: Bool {
        set {
            setRequirement(newValue, forKey: "isOutdoorWorkoutRequirementMet")
        }
        
        get {
            return getRequirement(forKey: "isOutdoorWorkoutRequirementMet")
        }
    }
    
    var isReadingRequirementMet: Bool {
        set {
            setRequirement(newValue, forKey: "isReadingRequirementMet")
        }
        
        get {
            return getRequirement(forKey: "isReadingRequirementMet")
        }
    }
    
    var isPictureRequirementMet: Bool {
        set {
            setRequirement(newValue, forKey: "isPictureRequirementMet")
        }
        
        get {
            return getRequirement(forKey: "isPictureRequirementMet")
        }
    }
    
    static let `default` = Self(number: 1)
    
    init(number: Int) {
        self.number = number
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
    
    mutating func setAllRequirements(_ value: Bool) {
        isDietRequirementMet = value
        isWaterRequirementMet = value
        isIndoorWorkoutRequirementMet = value
        isOutdoorWorkoutRequirementMet = value
        isReadingRequirementMet = value
        isPictureRequirementMet = value
    }
    
    private func setRequirement(_ newValue: Bool, forKey key: String) {
         UserDefaults.standard.set(newValue, forKey: "\(number)-\(key)")
    }
    
    private func getRequirement(forKey key: String) -> Bool {
        return UserDefaults.standard.object(forKey: "\(number)-\(key)") as? Bool ?? false
    }
}
