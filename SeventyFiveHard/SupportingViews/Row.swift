//
//  Row.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct Row: View {
    var day: Day
    
    var body: some View {
        HStack {
            Image("chilkoottrail")
                .resizable()
                .frame(width: 50, height: 50)
            Text(day.name)
            Spacer()
            
            if day.isRequirementMet {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Row(day: dayData[0])
            Row(day: dayData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
