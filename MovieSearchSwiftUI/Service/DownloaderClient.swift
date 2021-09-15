//
//  DownloaderClient.swift
//  MovieSearchSwiftUI
//
//  Created by Murat aslan on 10.09.2021.
//

import Foundation

class DowloaderClient{
    
    func moviesDownload(search: String, completion: @escaping(Result<[Movie]?,DownloaderError>) -> Void){
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=5a1566f7") else {
            return completion(.failure(.UrlMistake))
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , error == nil else {
                return completion(.failure(.noDataEntered))
            }
            guard let movieResponse = try? JSONDecoder().decode(incomingMovies.self, from: data) else {
                return completion(.failure(.didntProcessData))
            }
            completion(.success(movieResponse.movies))
        }.resume()
    }
    
    func movieDetailDown(imdbId : String, completion: @escaping (Result<MovieDetails, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=5a1566f7") else {
            return completion(.failure(.UrlMistake))
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , error == nil else {
                return completion(.failure(.noDataEntered))
            }
            guard let comingMovie = try? JSONDecoder().decode(MovieDetails.self, from: data) else {
                return completion(.failure(.didntProcessData))
            }
            completion(.success(comingMovie))
        }.resume()
    }
    
}

enum DownloaderError: Error {
    case UrlMistake
    case noDataEntered
    case didntProcessData
}













