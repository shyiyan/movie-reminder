//
//  Movie.swift
//  MovieReminder
//
//  Created by Emily Tian on 9/7/2023.
//

import Foundation

struct Movie: Decodable {
    var results: [movie]
    var page: Int
    struct movie: Decodable, Identifiable {
        var id: Int
        var original_title: String
        var genre_ids: [Int]
        var original_language: String
        var release_date: String
        var adult: Bool
        var overview: String
        var poster_path: String
        //var date: Date
    }
}
