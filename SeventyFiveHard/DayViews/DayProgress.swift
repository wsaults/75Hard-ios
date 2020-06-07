//
//  DayProgress.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 6/5/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct DayProgress: View {
    
    var count: Int
    
    static let rotationCount = 6
    var progessPies: some View {
        ForEach(0..<DayProgress.rotationCount) { i in
            if self.count > i {
                RotatedProgressPie(
                    angle: .degrees(Double(i) / Double(DayProgress.rotationCount)) * 360.0
                )
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            ForEach(0..<DayProgress.rotationCount) { i in
                Rectangle().fill(Color(self.count > i ? UIColor.red75 : UIColor.clear))
            }
        }
        .scaleEffect(x: 1, y: -1, anchor: .center)
        .frame(width: 36, height: 36)
        .clipShape(Circle())
//        GeometryReader { geometry in
//            self.progessPies
//                .scaleEffect(1.0 / 9.0, anchor: .top)
//                .position(x: geometry.size.width / 2.0, y: (3.0 / 3.4) * geometry.size.height)
//        }
//        .frame(width: 35, height: 35)
    }
}

struct DayProgress_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DayProgress(count: 0)
            DayProgress(count: 1)
            DayProgress(count: 4)
            DayProgress(count: 6)
        }
        .previewLayout(.fixed(width: 35, height: 35))
    }
}
