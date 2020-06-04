//
//  InfoCard.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 6/3/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct InfoCard: View {
    var headline: String
    var content: String
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(headline)
                .padding()
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(
                    Rectangle()
                    .fill(color)
                    .opacity(0.7)
                    .cornerRadius(10, corners: [.topLeft, .topRight])
                )
            }
            
            Text(content)
            .padding()
            .font(.body)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(
                Rectangle()
                .fill(color)
                .opacity(0.2)
                .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
            )
        }.padding()
    }
}

struct InfoCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InfoCard(
                headline: "Test Headline",
                content: "💪 The 75 Hard program was created by Andy Frisella. \nIn his words: \n\"75 HARD IS A TRANSFORMATIVE MENTAL TOUGHNESS PROGRAM\"",
                color: Color(UIColor.systemTeal)
            )
            .previewLayout(.fixed(width: 320, height: 300))
            
            InfoCard(
                headline: "Test Headline",
                content: "👋 Hi, I'm Will Saults. I hope that by building this app I'm able to give back to the 75 Hard community. Huge thanks to Andy Frisella for providing the program absolutly free!",
                color: Color(UIColor.systemIndigo)
            )
            .previewLayout(.fixed(width: 320, height: 300))
        }
    }
}
