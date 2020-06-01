//
//  Requirement.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct Requirement: Hashable, Codable, Identifiable {
    var id: Int
    var key: String
    var text: String
    var subtext: String
    fileprivate var imageName: String
    
    private enum CodingKeys: String, CodingKey {
        case id, key, text, subtext, imageName
    }
}

extension Requirement {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
