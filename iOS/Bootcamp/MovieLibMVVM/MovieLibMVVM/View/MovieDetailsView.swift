//
//  MovieDetailsView.swift
//  MovieLibMVVM
//
//  Created by Lili Cabral on 07/11/22.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movieDetailsViewModel: MovieDetailsViewModel
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: movieDetailsViewModel.poster).cornerRadius(10)
                
                Text(movieDetailsViewModel.title)
                    .font(.title)
                Text(movieDetailsViewModel.plot)
                Text("Director").fontWeight(.bold)
                Text(movieDetailsViewModel.director)
                Text("Actors").fontWeight(.semibold)
                Text(movieDetailsViewModel.actors)
                
                HStack {
                    Rating(rating: .constant(movieDetailsViewModel.rating))
                    Text("\(movieDetailsViewModel.rating)/10")
                }.padding(.top, 10)
                
                Spacer()
            }.padding()
            
                .navigationBarTitle(self.movieDetailsViewModel.title)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
        let movieDetails = MovieDetails(title: "Batman Begins", year: "1992", rated: "PG-13", plot: "After training with his mentor, Batman begins his fight to free crime-ridden Gotham City from corruption.", director: "Christopher Nolan", actors: "", imdbRating: "4.8", poster: "https://m.media-amazon.com/images/M/MV5BZmUwNGU2ZmItMmRiNC00MjhlLTg5YWUtODMyNzkxODYzMmZlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg", imdbId: "345fgD")
        
        return MovieDetailsView(movieDetailsViewModel: MovieDetailsViewModel(movieDetais: movieDetails))
        .embedNavigationView()
    }
}
