//
//  ViewModelBase.swift
//  MovieLibMVVM
//
//  Created by Lili Cabral on 07/11/22.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    
    @Published var loadingState: LoadingState = .none
    
}
