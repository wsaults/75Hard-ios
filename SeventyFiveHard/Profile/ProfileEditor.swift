//
//  ProfileEditor.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI


struct ProfileEditor: View {
    @Binding var profile: TempProfile
    @State private var showingAlert = false
    
//    var dateRange: ClosedRange<Date> {
//        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
//        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
//        return min...max
//    }
    
    var body: some View {
        VStack {
            Button("HARD Reset (Back to Day 1)") {
                self.showingAlert = true
            }
            .frame(maxWidth: .infinity)
            .font(.headline)
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(20)
            .padding()
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Reset to Day 1"),
                      message: Text("Are you sure?"),
                      primaryButton: .default(Text("Cancel")),
                      secondaryButton: .destructive(Text("Reset"), action: {
                        self.profile.progressDay = 1
                      })
                )
            }
                        
            List {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Current day in program:").bold()
                    
                    Picker("", selection: $profile.progressDay) {
                        ForEach(1 ... profile.maxDays, id: \.self) { i in
                            Text("\(i)")
                        }
                    }.padding(.top, -30)
                }.padding(.top)
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
