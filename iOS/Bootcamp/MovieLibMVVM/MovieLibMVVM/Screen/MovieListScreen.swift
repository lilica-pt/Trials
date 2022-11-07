//
//  MovieListScreen.swift
//  MovieLibMVVM
//
//  Created by Lili Cabral on 07/11/22.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListViewModel: MovieListViewModel
    @State private var movieName: String = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $movieName, onEditingChanged: { _ in }, onCommit: {
                self.movieListViewModel.searchByName(self.movieName)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            
                .navigationBarTitle("Movies")
            
            if self.movieListViewModel.loadingState == .success {
                MovieListView(movies: self.movieListViewModel.movies)
            } else if self.movieListViewModel.loadingState == .failed {
                FailedView()
            }
        }.padding().embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
