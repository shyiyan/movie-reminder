//
//  MovieReminderApp.swift
//  MovieReminder
//
//  Created by Emily Tian on 9/7/2023.
//

import SwiftUI

@main
struct MovieReminderApp: App {
    var modelData = ModelData()
    init() {
        modelData.getMovieGenres()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
