//
//  RequirementRow.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct RequirementRows: View {
    var items: [Requirement]
    
    var body: some View {
        VStack(spacing: 0) {
            RequirementItemRow(requirement: items[0])
            RequirementItemRow(requirement: items[1])
            RequirementItemRow(requirement: items[2])
            RequirementItemRow(requirement: items[3])
            RequirementItemRow(requirement: items[4])
            RequirementItemRow(requirement: items[5])
        }
    }
}

struct RequirementRow_Previews: PreviewProvider {
     static var previews: some View {
        RequirementRows(
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
