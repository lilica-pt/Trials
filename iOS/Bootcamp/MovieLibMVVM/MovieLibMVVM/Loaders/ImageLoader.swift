//
//  ImageLoader.swift
//  MovieLibMVVM
//
//  Created by Lili Cabral on 07/11/22.
//

import Foundation

class ImageLoader: ObservableObject {
    
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}
    
    
    // in SwiftUI there is no image control that can take an url, so we are making our own
