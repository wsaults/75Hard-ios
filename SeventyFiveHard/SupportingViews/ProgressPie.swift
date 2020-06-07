//
//  ProgressPie.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 6/4/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct ProgressPie: View {
    var color: Color
    
    var body: some View {

        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width
                let middle = width / 2
                let topHeight = 0.488 * height
                let spacing = width * 0.07
                
                let startPercent = 330
                let endPercent = 270
                
                let radius = min(width, height) / 2
                
                let startAngle = Angle(degrees: Double(startPercent))
                let endAngle = Angle(degrees: Double(endPercent))
                
                let center = CGPoint(x: middle, y: topHeight + spacing)
                path.move(to: center)
                
                path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            }
            .fill(self.color)
        }
    }
}

struct ProgressPie_Previews: PreviewProvider {
    static var previews: some View {
        ProgressPie(color: Color(UIColor.red75))
    }
}
