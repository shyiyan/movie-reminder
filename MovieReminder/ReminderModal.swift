//
//  ReminderModal.swift
//  MovieReminder
//
//  Created by Emily Tian on 11/7/2023.
//

import SwiftUI
import UserNotifications

struct alertDetails: Identifiable {
    var id : String {title}
    let title: String
    let description: String
}



struct ReminderModal: View {
    @EnvironmentObject var modelData: ModelData
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
    var movie: Movie.movie
    
    func getDate(dateStr: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: dateStr)
    }
    
    var body: some View {
        VStack {
            Text("Set reminder for: ")
                .fontDesign(.serif)
                .font(.title2)
                .padding(.bottom)
            HStack {
                Button {
                    showingWeekAlert = true
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                        
                    }
                } label: {
                    HStack {
                        Image(systemName: "calendar")
                        Text("A WEEK BEFORE RELEASE")
                    }
                }
                .alert("Send notification a week before release",
                       isPresented: $showingWeekAlert,
                       presenting: weekAlert
                ) { details in
                    Button("Confirm") {
                        //notification content
                        let notiContent = UNMutableNotificationContent()
                        notiContent.title = "Upcoming movie: \(movie.original_title)"
                        notiContent.subtitle = "\(movie.original_title) will be coming out in a week"
                        notiContent.sound = UNNotificationSound.default
                        
                        //notification trigger time
                        var calendar = Calendar.current
                        calendar.timeZone = TimeZone.current
                        let releaseDate = getDate(dateStr: movie.release_date)
                        let notiDate = calendar.date(byAdding: .day, value: -7, to: releaseDate!)!
                        let comps = Calendar.current.dateComponents([.year, .month, .day], from: notiDate)
                        let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: false)
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notiContent, trigger: trigger)
                        UNUserNotificationCenter.current().add(request)
                        print(notiDate)
                    }
                    Button("Cancel", role: .cancel) {
                        //notification content
                        let notiContent = UNMutableNotificationContent()
                        notiContent.title = "Upcoming movie: \(movie.original_title)"
                        notiContent.subtitle = "\(movie.original_title) will be coming out in a week"
                        notiContent.sound = UNNotificationSound.default
                        
                        //notification trigger time
                        var calendar = Calendar.current
                        calendar.timeZone = TimeZone.current
                        let releaseDate = getDate(dateStr: movie.release_date)
                        let notiDate = calendar.date(byAdding: .day, value: -1, to: releaseDate!)!
                        //let comps = Calendar.current.dateComponents([.year, .month, .day], from: Date().)
                        let comps = Calendar.current.dateComponents([.year, .month, .day], from: notiDate)
                        let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: false)
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: notiContent, trigger: trigger)
                        UNUserNotificationCenter.current().add(request)
                    }
                    
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
    static let modelData = ModelData()
    static let movieExample = Movie(results: [Movie.movie(id: 1, original_title: "Movie 1", genre_ids: [1], original_language: "en-US", release_date: "2023-07-10", adult: true, overview: "a movie", poster_path: "/qW4crfED8mpNDadSmMdi7ZDzhXF.jpg")], page: 1)
    static var previews: some View {
        ReminderModal(isPresented: .constant(false), movie: movieExample.results[0])
            .environmentObject(modelData)
    }
}
