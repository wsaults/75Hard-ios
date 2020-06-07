//
//  RotatedProgressPie.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 6/5/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct RotatedProgressPie: View {
    let angle: Angle
    
    var body: some View {
        ProgressPie(color: Color(UIColor.red75))
            .padding(-140)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedProgressPie_Previews: PreviewProvider {
    static var previews: some View {
        RotatedProgressPie(angle: .init(degrees: 0))
    }
}
