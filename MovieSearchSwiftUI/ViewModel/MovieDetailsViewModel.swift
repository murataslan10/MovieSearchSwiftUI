//
//  MovieDetailsViewModel.swift
//  MovieSearchSwiftUI
//
//  Created by Murat Aslan on 14.09.2021.
//

import Foundation
import SwiftUI

class MovieDetailsViewModel : ObservableObject {
    @Published var movieDetail : DetailsMovieViewModel?
    
    let downloaderClient = DowloaderClient()
    
    func takeMovieDetails(imdbOId: String){
        
        downloaderClient.movieDetailDown(imdbId: imdbOId) { (result) in
            switch result{
            case .failure(let mistake):
            print(mistake)
            case .success(let movieDEtails):
                DispatchQueue.main.async {
                    self.movieDetail = DetailsMovieViewModel(detail: movieDEtails)
                }
               
            }
        }
        
        
    }
}

struct DetailsMovieViewModel{
    
    let detail : MovieDetails
    
    var title : String{
        detail.title
    }
    var year : String{
        detail.year
    }
    var genre : String{
        detail.genre
    }
    var director : String{
        detail.genre
    }
    var writer : String{
        detail.genre
    }
    var actor : String{
        detail.actor
    }
    var plot : String{
        detail.plot
    }
    var awards : String{
        detail.awards
    }
    var poster : String{
        detail.poster
    }
    var metascore : String{
        detail.metascore
    }
    var imdbRating : String{
        detail.imdbRating
    }
    var imdbId : String{
        detail.imdbId
    }
    
    
    
    
    
}













