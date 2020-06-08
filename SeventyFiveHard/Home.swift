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
                ProfileHost()
                    .environmentObject(self.userData)
            }
            .navigationBarTitle(Text("75HARD"), displayMode: .inline)
        }
    }
    
    static let dayFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }()
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(UserData())
    }
}
