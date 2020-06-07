//
//  StoreHelpers.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 6/6/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import Foundation
import StoreKit

class StoreHelpers {
    
    static func askForReviewIfNeeded() {
        let appUsageCount = getAppUsageCount()
        if (appUsageCount > 10) {
            SKStoreReviewController.requestReview()
            resetAppUsageCount()
        }
    }
    
    static func resetAppUsageCount() {
        UserDefaults.standard.set(0, forKey: "appUsageCount")
    }
    
    static func incrementAppUsageCount() {
        let appUsageCount = getAppUsageCount()
        UserDefaults.standard.set(appUsageCount + 1, forKey: "appUsageCount")
    }
    
    static func getAppUsageCount() -> Int {
        return UserDefaults.standard.object(forKey: "appUsageCount") as? Int ?? 0
    }
}
