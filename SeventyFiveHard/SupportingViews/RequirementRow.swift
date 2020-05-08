//
//  RequirementRow.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct RequirementRow: View {
    var items: [Requirement]
    
    var body: some View {
        VStack() {
            HStack() {
                RequirementItem(requirement: items[0])
                RequirementItem(requirement: items[1])
            }
            .padding(.bottom)
            HStack() {
                RequirementItem(requirement: items[2])
                RequirementItem(requirement: items[3])
            }
            .padding(.bottom)
            HStack() {
                RequirementItem(requirement: items[4])
                RequirementItem(requirement: items[5])
            }
        }
        .padding(.trailing)
    }
}

struct RequirementRow_Previews: PreviewProvider {
     static var previews: some View {
        RequirementRow(
            items: Array(requirementData)
        )
//           Group {
//            RequirementRow(label: "🥦 Follow a diet")
//            RequirementRow(label: "💪🏻 2x 45 Min workous")
//            RequirementRow(label: "💧 1 gallon of water")
//            RequirementRow(label: "📖 10 pages of reading")
//            RequirementRow(label: "📸 Take a progress picture")
//           }
//           .previewLayout(.fixed(width: 300, height: 70))
       }
}
