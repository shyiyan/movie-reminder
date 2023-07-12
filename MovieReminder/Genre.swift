//
//  Genre.swift
//  MovieReminder
//
//  Created by Emily Tian on 12/7/2023.
//

import Foundation

struct MovieGenre: Decodable {
    var genres: [genre]
    struct genre: Decodable, Identifiable {
        var id: Int
        var name: String
    }
}
