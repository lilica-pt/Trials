//
//  ViewExtension.swift
//  MovieLibMVVM
//
//  Created by Lili Cabral on 07/11/22.
//

import Foundation
import SwiftUI

extension View {
    
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
}
