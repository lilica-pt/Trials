//
//  MovieDetailsScreen.swift
//  MovieLibMVVM
//
//  Created by Lili Cabral on 07/11/22.
//

import SwiftUI

struct MovieDetailsScreen: View {
    
    let imdbID: String
    @ObservedObject var movieDetailsViewModel = MovieDetailsViewModel()
    
    var body: some View {
        VStack{
            
            if movieDetailsViewModel.loadingState == .loading {
                LoadingView()
            } else if movieDetailsViewModel.loadingState == .success {
                MovieDetailsView(movieDetailsViewModel: movieDetailsViewModel)
            } else if movieDetailsViewModel.loadingState == .failed {
                FailedView()
            }
        }
        
        .onAppear{
            self.movieDetailsViewModel.getDetailsByImdb(imdbId: self.imdbID)
        }
    }
}
