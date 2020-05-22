/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores user profile data.
*/

import Foundation

struct Profile {
    let maxDays = 75
    
    var currentDay: Int {
        didSet {
            UserDefaults.standard.set(currentDay, forKey: "currentDay")
        }
    }
    
    var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    
    var prefersNotifications: Bool
    var seasonalPhoto: Season
    var goalDate: Date
    
    static let `default` = Self(prefersNotifications: true, seasonalPhoto: .winter)
    
    init(prefersNotifications: Bool = true, seasonalPhoto: Season = .winter) {
        self.currentDay = UserDefaults.standard.object(forKey: "currentDay") as? Int ?? 1
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
    }
    
    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}
