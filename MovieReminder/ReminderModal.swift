//
//  ReminderModal.swift
//  MovieReminder
//
//  Created by Emily Tian on 11/7/2023.
//

import SwiftUI

struct alertDetails: Identifiable {
    var id : String {title}
    let title: String
    let description: String
}

struct ReminderModal: View {
    @Binding var isPresented: Bool
    @State private var showingWeekAlert = false
    @State private var showingDayAlert = false
    @State private var weekAlert = alertDetails(
        title: "A Week Before",
        description: "You will receive a notification a week before movie release"
    )
    @State private var dayAlert = alertDetails(
        title: "A Day Before",
        description: "You will receive a notification a day before movie release"
    )
    var body: some View {
        VStack {
            Text("Set reminder for: ")
                .fontDesign(.serif)
                .font(.title2)
                .padding(.bottom)
            HStack {
                Button {
                    showingWeekAlert = true
                } label: {
                    HStack {
                        Image(systemName: "calendar")
                        Text("Confirm")
                    }
                }
                .alert("Send notification a week before release",
                       isPresented: $showingWeekAlert,
                       presenting: weekAlert
                ) { details in
                    Button("Confirm") { }
                    Button("Cancel", role: .cancel) { }
                    
                } message: { details in
                    Text(details.description)
                }
                .frame(maxWidth: .infinity, alignment: .center).padding()
                
                Button(action: {
                    showingDayAlert = true
                }, label: {
                    Label("A DAY BEFORE RELEASE", systemImage: "calendar")
                        .foregroundColor(.blue)
                })
                .alert("Send notification a week before release",
                       isPresented: $showingDayAlert,
                       presenting: dayAlert
                ) { details in
                    Button("Confirm") { }
                    Button("Cancel", role: .cancel) { }
                    
                } message: { details in
                    Text(details.description)
                }
                .frame(maxWidth: .infinity, alignment: .center).padding()
            }
        }
    }
}

struct ReminderModal_Previews: PreviewProvider {
    static var previews: some View {
        //ReminderModal()
        ReminderModal(isPresented: .constant(false))
    }
}
