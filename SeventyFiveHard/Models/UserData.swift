//
//  UserData.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showRequirementsMetOnly = false
    @Published var days = dayData
    @Published var profile = Profile.default
}
