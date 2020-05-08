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

struct RequirementItem: View {
    var requirement: Requirement
    var body: some View {
        ZStack(alignment: .leading) {
            requirement.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(10)
                .shadow(radius: 10)
            
            VStack() {
                Text(requirement.text)
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 140)
                    .padding(.leading, 5)
                Text(requirement.subtext)
                    .foregroundColor(.white)
                    .font(.caption)
                    .frame(width: 140)
                    .padding(.leading, 5)
            }
            
            if requirement.isRequirementMet {
                Image(systemName: "checkmark.circle.fill")
                    .imageScale(.large)
                    .foregroundColor(.green)
                    .frame(width: 140, height: 120, alignment: .bottomTrailing)
            } else {
                Image(systemName: "circle")
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .frame(width: 140, height: 120, alignment: .bottomTrailing)
            }
        }
        .padding(.leading)
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
