//
//  MovieDetailModel.swift
//  MovieSearchSwiftUI
//
//  Created by Murat Aslan on 14.09.2021.
//

import Foundation

struct MovieDetails : Codable {
    
    let title : String
    let year : String
    let genre : String
    let director : String
    let writer : String
    let actor : String
    let plot : String
    let awards : String
    let poster : String
    let metascore : String
    let imdbRating : String
    let imdbId : String
    
    private enum CodingKeys : String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actor = "Actors"
        case plot = "Plot"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbId = "imdbID"
    }
  
}
