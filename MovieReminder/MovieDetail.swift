//
//  MovieDetauk.swift
//  MovieReminder
//
//  Created by Emily Tian on 10/7/2023.
//

import SwiftUI

struct MovieDetail: View {
    @EnvironmentObject var modelData: ModelData
    var movie: Movie.movie
    var body: some View {
        VStack (alignment: .center){
            VStack (alignment: .trailing){
                HStack{
                    Spacer()
                    Image(systemName: "bell")
                        .foregroundColor(.blue)
                    Button("Set Reminder") {
                    }
                }
                .padding(.trailing)
            }
            
            AsyncImage(url: URL(string:"https://image.tmdb.org/t/p/w300" + movie.poster_path))
            Text(movie.original_title).font(.title).bold()
                .padding([.bottom, .trailing],3)
            Text("Release date: " + movie.release_date)
                .padding([.bottom, .trailing],3)
            if (movie.adult) {
                Text("Appropriate to ages 18+")
                    .padding([.bottom, .trailing],3)
            }
            Text("Synopsis: " + movie.overview)
                .padding([.bottom, .trailing],3)
            
        }
        .multilineTextAlignment(.center)
        .fontDesign(.serif)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    static let movieExample = Movie(results: [Movie.movie(id: 1, original_title: "Movie 1", genre_ids: [1], original_language: "en-US", release_date: "2023-07-10", adult: true, overview: "a movie", poster_path: "/qW4crfED8mpNDadSmMdi7ZDzhXF.jpg")], page: 1)
    static var previews: some View {
        MovieDetail(movie: movieExample.results[0])
            .environmentObject(modelData)
    }
}
