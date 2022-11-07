//
//  HTTPClient.swift
//  MovieLibMVVM
//
//  Created by Lili Cabral on 07/11/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HTTPClient {
    
    func getMovieDetaislBy(imdbID: String, completion: @escaping(Result<MovieDetails, NetworkError> ) -> Void) {
        
        guard let url = URL.forMoviesByImdbID(imdbID) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieDetails = try? JSONDecoder().decode(MovieDetails.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieDetails))
            
        }.resume()
    }
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?,NetworkError>) -> Void) {
        
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            completion(.success(moviesResponse.movies))
        }.resume()
    }
}

// make a request to the url, get the json file, convert to model and give an array of results
