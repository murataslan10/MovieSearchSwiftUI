//
//  MovieViewModel.swift
//  MovieSearchSwiftUI
//
//  Created by Murat Aslan on 13.09.2021.
//

import Foundation
import SwiftUI

class MovieListViewModel : ObservableObject {
    
    @Published var movie = [MovieViewModel]()
    
    let downloaderClient = DowloaderClient()
    
    func doMovieSearch(movieName : String) {
        downloaderClient.moviesDownload(search: movieName) { (result) in
            switch result{
            case.failure(let mistake):
            print(mistake)
            
            case . success(let movieArray):
                if let movieArray = movieArray {
                    DispatchQueue.main.async {
                        self.movie = movieArray.map(MovieViewModel.init)
                    }
                    
                }
                
            }
            
        }
    }
   
}

struct MovieViewModel {
    
    let movie : Movie
    
    var title : String{
        movie.title
    }
    
    var poster : String{
        movie.poster
    }
    
    var year: String{
        movie.year
    }
    
    var imdbID : String{
        movie.imdbId
    }
}
