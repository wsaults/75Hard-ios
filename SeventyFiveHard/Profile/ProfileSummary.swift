//
//  ProfileSummary.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
//    static let goalFormat: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        formatter.timeStyle = .none
//        return formatter
//    }()
    
    var body: some View {
        List {
            Text("Current Day: \(self.profile.currentDay)")
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
