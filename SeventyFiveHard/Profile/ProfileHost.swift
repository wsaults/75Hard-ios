//
//  ProfileHost.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    @State var draftProfile = Profile.default
    @State var tempProfile = TempProfile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.tempProfile = TempProfile.default
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                    .padding(.leading)
                    .padding(.top)
                }
                Spacer()
                EditButton()
                    .padding(.trailing)
                    .padding(.top)
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(currentDay: userData.profile.currentDay)
            } else {
                ProfileEditor(profile: $tempProfile)
                    .onAppear {
                        if self.tempProfile.needsUpdate() {
                            self.userData.profile.currentDay = self.tempProfile.progressDay
                            self.userData.profile.progressDay = self.tempProfile.progressDay
                        }
                        
                        self.draftProfile = self.userData.profile
                    }
                    .onDisappear {
                        if self.tempProfile.needsUpdate() {
                            self.draftProfile.currentDay = self.tempProfile.progressDay
                            self.draftProfile.progressDay = self.tempProfile.progressDay
                        }
                        
                        self.userData.profile = self.draftProfile
                    }
            }
        }
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}
