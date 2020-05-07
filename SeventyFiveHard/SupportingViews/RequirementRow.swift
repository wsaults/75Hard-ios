//
//  RequirementRow.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct RequirementRow: View {
    var label: String
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            
//            if day.isRequirementMet {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
//            }
        }
    }
}

struct RequirementRow_Previews: PreviewProvider {
     static var previews: some View {
           Group {
            RequirementRow(label: "🥦 Follow a diet")
            RequirementRow(label: "💪🏻 2x 45 Min workous")
            RequirementRow(label: "💧 1 gallon of water")
            RequirementRow(label: "📖 10 pages of reading")
            RequirementRow(label: "📸 Take a progress picture")
           }
           .previewLayout(.fixed(width: 300, height: 70))
       }
}
