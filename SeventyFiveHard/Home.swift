//
//  Home.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "info.circle")
                .imageScale(.large)
                .accessibility(label: Text("Settings"))
                .foregroundColor(.primary)
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            DayGridView()
            .environmentObject(self.userData)
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost(profile: self.$draftProfile)
                    .onAppear {
                        self.draftProfile = self.userData.profile
                    }
                    .onDisappear {
                        self.userData.profile = self.draftProfile
                    }
            }
            .navigationBarTitle(Text("75HARD"), displayMode: .inline)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(UserData())
    }
}



// ============== Add later for page view ==============
//
//    leading: gridViewButton,
//    var gridViewButton: some View {
//        Button(action: {
//            self.showDayView.toggle()
//        }) {
//            Image(systemName: "circle.grid.3x3")
//                .imageScale(.large)
//                .accessibility(label: Text("Grid View"))
//                .foregroundColor(.black)
//                .padding()
//        }
//    }

//if showDayView {
//    DayPageView(
//        days: days.map {
//            DayView(currentDay: userData.profile.currentDay, day: $0)
//        }
//    ).transition(transition)
//}

//var transition: AnyTransition {
//    let insertion = AnyTransition.scale.combined(with: .opacity)
//    let removal = AnyTransition.scale.combined(with: .opacity)
//    return .asymmetric(insertion: insertion, removal: removal)
//}
