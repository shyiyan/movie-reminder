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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ReminderModal_Previews: PreviewProvider {
    static var previews: some View {
        //ReminderModal()
        ReminderModal(isPresented: .constant(false))
    }
}
