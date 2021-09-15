//
//  ContentView.swift
//  MovieSearchSwiftUI
//
//  Created by Murat Aslan on 10.09.2021.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListviewModel : MovieListViewModel
    
    @State var searchMovie = ""
    
    init() {
        self.movieListviewModel = MovieListViewModel()
       
    }
    
    var body: some View {
        NavigationView{
            
            VStack{
            TextField("Search Movie", text: $searchMovie, onEditingChanged: {_ in }, onCommit: {
                self.movieListviewModel.doMovieSearch(movieName: searchMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchMovie)
            }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
            
        List(movieListviewModel.movie, id: \.imdbID){  movie in
            NavigationLink(
                destination: DetailView(imdbId: movie.imdbID),
                label: {
                    HStack () {
                        specialImage(url: movie.poster)
                            .frame(width :90, height: 90)
                    
                    VStack (alignment: .leading) {
                        Text(movie.title)
                            .bold()
                            .font(.title3)
                        
                        Text(movie.year)
                            .bold()
                            .font(.title3)
                            .foregroundColor(.purple)
                        
                        }
                }
                })
           
        }.navigationTitle(Text("Searching Movies"))
      
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
