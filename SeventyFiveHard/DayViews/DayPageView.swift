//
//  DayPageView.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/9/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct DayPageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0

    init(days views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        VStack {
            DayPageViewController(controllers: viewControllers, currentPage: $currentPage)
        }
    }
}

struct DayPageView_Previews: PreviewProvider {
    static var previews: some View {
        let days = [
            Day(number: 1),
            Day(number: 2),
            Day(number: 3)
        ]
        return DayPageView(days: days.map {
            DayView(currentDay: 1, day: .constant($0))
        })
    }
}
