//
//  RequirementItemRow.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/30/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct RequirementItemRow: View {
    var requirement: Requirement
    @Binding var day: Day
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(UIColor.red75))
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Spacer()
                        Text(requirement.text)
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        if requirement.subtext.count > 0 {
                            Text(requirement.subtext)
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                    }.padding()
                    
                    Spacer()
                    VStack {
                        Spacer()
                        Image(systemName: day.requirementById(id: requirement.id) ? "checkmark.circle.fill" : "circle")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                    }
                }
            }
            Divider()
        }
        .onTapGesture {
            let id = self.requirement.id
            let toggleValue = !self.day.requirementById(id: id)
            self.day.setRequirementById(id: id, value: toggleValue)
//            self.day.requirementMetCount = self.day.countRequirementsMet()
        }
    }
}

struct RequirementItemRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RequirementItemRow(requirement: requirementData[1], day: .constant(.default))
            RequirementItemRow(requirement: requirementData[2], day: .constant(.default))
        }
        .previewLayout(.fixed(width: 320, height: 100))
    }
}
