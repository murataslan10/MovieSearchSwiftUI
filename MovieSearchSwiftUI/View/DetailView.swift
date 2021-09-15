//
//  DetailView.swift
//  MovieSearchSwiftUI
//
//  Created by Murat aslan on 14.09.2021.
//

import SwiftUI

struct DetailView: View {
    
    let imdbId : String
    
    @ObservedObject var movieDEtailViewModel = MovieDetailsViewModel()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 5 ){
            
            HStack{
                Spacer()
                specialImage(url: movieDEtailViewModel.movieDetail?.poster ?? "Movie image will be shown").frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.2, alignment: .center)
                Spacer()
            }
            
            
            Text(movieDEtailViewModel.movieDetail?.title ?? "Movie name will be shown").bold().padding().font(.title2).foregroundColor(.purple)
            
            Text("Year: \(movieDEtailViewModel.movieDetail?.year ?? "Movie year will be shown")").bold().padding()
            
            Text("Actor: \(movieDEtailViewModel.movieDetail?.actor ?? "Movie Actor will be shown")").bold().padding()

            
            Text("Plot: \(movieDEtailViewModel.movieDetail?.plot ?? "Movie plot will be shown")").bold().padding()
            
            Text("Director: \(movieDEtailViewModel.movieDetail?.director ?? "Movie director will be shown")").bold().padding()
            
            Text("Writer: \(movieDEtailViewModel.movieDetail?.writer ?? "Movie writer will be shown")").bold().padding()
            
            Text("Awards: \(movieDEtailViewModel.movieDetail?.awards ?? "Movie Awards will be shown")").bold().padding()
            
            Text("Imdb Rating: \(movieDEtailViewModel.movieDetail?.imdbRating ?? "Movie Imdb Rating will be shown")").bold().padding()
            
            Text("Meta Score: \(movieDEtailViewModel.movieDetail?.metascore ?? "Movie Meta Score will be shown")").bold().padding()
            
        }.onAppear(perform: {
            self.movieDEtailViewModel.takeMovieDetails(imdbOId: imdbId)
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}
