//
//  ProfileSummary.swift
//  SeventyFiveHard
//
//  Created by Will Saults on 5/7/20.
//  Copyright © 2020 Will Saults. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    fileprivate let podcastUrlString = "https://andyfrisella.com/blogs/mfceo-project-podcast/75hard-a-75-day-tactical-guide-to-winning-the-war-with-yourself-with-andy-frisella-mfceo291"
    
    var currentDay: Int
    
//    static let goalFormat: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        formatter.timeStyle = .none
//        return formatter
//    }()
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Current Day:")
                    Spacer()
                    Text("\(currentDay)")
                }
            }
            
            Section(header: Text("Resources")) {
                HStack {
                    Text("Info:")
                    Spacer()
                    Button(action: {
                        let url: NSURL = URL(string: "https://andyfrisella.com/pages/75hard-info")! as NSURL
                        UIApplication.shared.open(url as URL)
                    }) {
                        Text(verbatim: "andyfrisella.com/75hard-info")
                            .foregroundColor(Color(UIColor.systemBlue))
                    }
                }
                
                HStack {
                    Text("Podcast:")
                    Spacer()
                    Button(action: {
                        let url: NSURL = URL(string: self.podcastUrlString)! as NSURL
                        UIApplication.shared.open(url as URL)
                    }) {
                        Text(verbatim: "andyfrisella.com/75hard-podcast")
                            .foregroundColor(Color(UIColor.systemBlue))
                    }
                }
                
                HStack {
                    Text("Instagram:")
                    Spacer()
                    Button(action: {
                        let url: NSURL = URL(string: "https://www.instagram.com/andyfrisella/")! as NSURL
                        UIApplication.shared.open(url as URL)
                    }) {
                        Text(verbatim: "instagram.com/andyfrisella")
                            .foregroundColor(Color(UIColor.systemBlue))
                    }
                    
                }
            }
            
            VStack {
                InfoCard(headline: "Daily 75 Hard Rules",
                        content:
                        "🛌 You have until you go to sleep to complete the day\n\n" +
                        "🚫 No alcohol or cheat meals\n\n" +
                        "🌦 1 of your workouts MUST be outdoors\n\n" +
                        "🔇 Audio books DO NOT count\n\n" +
                        "💀 Start on day 1 if you fail"
                        ,
                        color: Color(UIColor.systemRed))
                
                InfoCard(headline: "About 75 Hard",
                         content: "💪 The 75 Hard program was created by Andy Frisella. In his words: \n\"75 HARD IS A TRANSFORMATIVE MENTAL TOUGHNESS PROGRAM\" Visit the links above to learn more.",
                         color: Color(UIColor.systemBlue))
                
                InfoCard(headline: "About the Developer",
                         content: "👋 Hi, I'm Will Saults. I hope that by building this app I'm able to give back to the 75 Hard community. Huge thanks to Andy Frisella for providing the program absolutly free!",
                         color: Color(UIColor.systemTeal))
                
                InfoCard(headline: "DISCLAIMER",
                         content: "You should consult your physician or other health care professional before starting 75 Hard or any other fitness program to determine if it is right for your needs. Do not start 75 Hard if your physician or health care provider advises against it.",
                         color: Color(UIColor.systemGray))
            }
            .padding(.all, -10)
            .listRowBackground(Color(UIColor.systemGray6))
        }
        .listStyle(GroupedListStyle())
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(currentDay: 1)
    }
}
