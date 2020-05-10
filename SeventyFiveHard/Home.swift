//
//  Home.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct Home: View {
    var days: [Day]
    
    @State var showingProfile = false
    @State var showDayView = true
    @EnvironmentObject var userData: UserData
    
    var transition: AnyTransition {
        let insertion = AnyTransition.scale.combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    var gridViewButton: some View {
        Button(action: {
            self.showDayView.toggle()
        }) {
            Image(systemName: "circle.grid.3x3")
                .imageScale(.large)
                .accessibility(label: Text("Grid View"))
                .foregroundColor(.black)
                .padding()
        }
    }
//    "square.stack.3d.up"  -  Day View
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "gear")
                .imageScale(.large)
                .accessibility(label: Text("Settings"))
                .foregroundColor(.black)
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                if showDayView {
                    DayPageView(days.map {
                        DayView(day: $0)
                    })
                    .transition(transition)
                } else {
                    DayGridView(days: days).transition(transition)
                }
            }
            .navigationBarItems(leading: gridViewButton, trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(self.userData)
            }
            .navigationBarTitle(Text("75HARD"), displayMode: .inline)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(days: [
            Day(number: 1, date: Date(), areRequirementsMet: false),
            Day(number: 2, date: Date(), areRequirementsMet: false),
            Day(number: 3, date: Date(), areRequirementsMet: false)]
        )
    }
}
