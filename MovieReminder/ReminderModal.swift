//
//  ReminderModal.swift
//  MovieReminder
//
//  Created by Emily Tian on 11/7/2023.
//

import SwiftUI

struct ReminderModal: View {
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            Text("Set reminder for: ")
                .fontDesign(.serif)
                .font(.title2)
                .padding(.bottom)
            HStack {
                Button(action: {
                }, label: {
                    Label("A WEEK BEFORE RELEASE", systemImage: "calendar")
                        .foregroundColor(.blue)
                })
                .frame(maxWidth: .infinity, alignment: .center).padding()
                
                Button(action: {
                }, label: {
                    Label("A DAY BEFORE RELEASE", systemImage: "calendar")
                        .foregroundColor(.blue)
                })
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
