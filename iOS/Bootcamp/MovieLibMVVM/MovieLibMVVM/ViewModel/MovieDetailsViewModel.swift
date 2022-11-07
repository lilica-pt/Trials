//
//  MovieDetailsViewModel.swift
//  MovieLibMVVM
//
//  Created by Lili Cabral on 07/11/22.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    
    private var movieDetais: MovieDetails?
    @Published var loadingState = LoadingState.loading
    
    private var httpClient = HTTPClient()
    
    init(movieDetais: MovieDetails? = nil) {
        self.movieDetais = movieDetais
    }
    
    
    func getDetailsByImdb(imdbId: String){
        
        httpClient.getMovieDetaislBy(imdbID: imdbId) { result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.movieDetais = details
                    self.loadingState = .success
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
        
    }
    
    var title: String {
        self.movieDetais?.title ?? ""
    }
    
    var poster: String {
        self.movieDetais?.poster ?? ""
    }
    
    var plot: String {
        self.movieDetais?.plot ?? ""
    }
    
    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieDetais?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var director: String {
        self.movieDetais?.director ?? ""
    }
    
    var actors: String {
        self.movieDetais?.actors ?? ""
    }
    
}
