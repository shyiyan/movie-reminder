//
//  ContentView.swift
//  MovieReminder
//
//  Created by Emily Tian on 9/7/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selectedGenreID = 0
    var body: some View {
        NavigationView {
            ScrollView{
                VStack (alignment: .leading){
                    HStack (alignment : .center){
                        Image("ticket-pic")
                            .resizable()
                            .frame(width: 120, height: 100)
                        Text("Upcoming Movies")
                            .font(.title)
                            .bold()
                            .fontDesign(.serif)
                        
                    }
                    .frame(alignment: .leading)
                    if (modelData.movieGenres.genres.count > 0){
                        Picker("Select a genre", selection: $selectedGenreID) {
                            ForEach(0..<modelData.movieGenres.genres.count) { index in
                                Text(modelData.movieGenres.genres[index].name)
                         }
                         }
                         .pickerStyle(.menu)
                    }
                    
                        
                    VStack(alignment: .leading) {
                        ForEach((modelData.upcomingMovies.results)) { movie in
                            NavigationLink {
                                MovieDetail(movie: movie)
                            } label: {
                                if (modelData.movieGenres.genres.count > 0){
                                    if (movie.genre_ids.contains(modelData.movieGenres.genres[selectedGenreID].id)) {
                                        MovieCard(movie: movie)
                                            .padding()
                                            .cornerRadius(15)
                                            .clipShape(Capsule())
                                            .shadow(radius: 10)
                                    }
                                }
                            }
                        }
                        
                        
                    }
                    Spacer()
                }
            }
        }
        .onAppear {
            modelData.getUpcomingMovies()
            modelData.getMovieGenres()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        ContentView().environmentObject(modelData)
    }
}
