//
//  Day.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import Foundation

struct Day: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    
//    var requirements: [Requirement] = []
    var isRequirementMet: Bool
    var isFeatured: Bool
    var category: Category
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}
