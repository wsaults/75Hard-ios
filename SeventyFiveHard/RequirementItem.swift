//
//  RequirementItem.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/8/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct RequirementItem: View {
    var requirement: Requirement
    
    let gradient = Gradient(colors: [.clear, .black])
    
    var body: some View {
        ZStack(alignment: .leading) {
            requirement.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(10)
                .shadow(radius: 10)
            
            ZStack() {
                Rectangle()
                    .fill(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
                    .cornerRadius(10)
                
                VStack() {
                    Spacer()
                    Text(requirement.text)
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 140, alignment: .bottomLeading)
                        .padding(.bottom, 10)
                    
                    if requirement.subtext.count > 0 {
                        Text(requirement.subtext)
                        .foregroundColor(.white)
                        .font(.caption)
                        .frame(width: 140, alignment: .bottomLeading)
                        .padding(.top, -10)
                        .padding(.bottom, 10)
                    }
                }
                
                if requirement.isRequirementMet {
                    Image(systemName: "checkmark.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.green)
                        .frame(width: 130, height: 130, alignment: .bottomTrailing)
                } else {
                    Image(systemName: "circle")
                        .imageScale(.large)
                        .foregroundColor(.white)
                        .frame(width: 130, height: 130, alignment: .bottomTrailing)
                }
            }.frame(width: 155, height: 155)
        }
        .padding(.leading)
    }
}

struct RequirementItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RequirementItem(requirement: requirementData[1])
            RequirementItem(requirement: requirementData[2])
        }
        .previewLayout(.fixed(width: 180, height: 160))
    }
}
