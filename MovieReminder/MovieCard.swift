//
//  MovieCard.swift
//  MovieReminder
//
//  Created by Emily Tian on 10/7/2023.
//

import SwiftUI

struct MovieCard: View {
    @EnvironmentObject var modelData: ModelData
    var movie: Movie.movie
    var body: some View {
        HStack {
            AsyncImage(url: URL(string:"https://image.tmdb.org/t/p/w92" + movie.poster_path))
            VStack (alignment: .leading){
                Text(movie.original_title).font(.title2).foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                Text(movie.release_date) .foregroundColor(.black)
            }
        }
    }
}

struct MovieCard_Previews: PreviewProvider {
    static let modelData = ModelData()
    static let movieExample = Movie(results: [Movie.movie(id: 1, original_title: "Movie 1", genre_ids: [1], original_language: "en-US", release_date: "10 July 2023", adult: false, overview: "a movie", poster_path: "/qW4crfED8mpNDadSmMdi7ZDzhXF.jpg")], page: 1)

    static var previews: some View {
        MovieCard(movie: movieExample.results[0])
            .environmentObject(modelData)
    }
}
