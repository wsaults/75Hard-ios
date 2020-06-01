/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores user profile data.
*/

import Foundation

struct Profile {
    let maxDays = 75
    
    var days: [Day]
    
//    {
//        didSet {
//            do {
//                let encodedDays = try NSKeyedArchiver.archivedData(withRootObject: days, requiringSecureCoding: false)
//                UserDefaults.standard.set(encodedDays, forKey: "days")
//            } catch {
//                print("error is: \(error.localizedDescription)")
//            }
//        }
//    }
    
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
    var goalDate: Date
    
    static let `default` = Self(prefersNotifications: true)
    
    init(prefersNotifications: Bool = true) {
        self.currentDay = UserDefaults.standard.object(forKey: "currentDay") as? Int ?? 1
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.prefersNotifications = prefersNotifications
        self.goalDate = Date()
        self.days = Helpers.createDays()

//        if let days = UserDefaults.standard.object(forKey: "days") as? Data {
//            do {
//                self.days = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(days) as! [Day]
//            } catch {
//                self.days = Helpers.createDays()
//                print("error is: \(error.localizedDescription)")
//            }
//        } else {
//            self.days = Helpers.createDays()
//        }
    }
}
