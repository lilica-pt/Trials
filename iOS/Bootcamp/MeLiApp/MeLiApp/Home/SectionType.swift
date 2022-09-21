//
//  SectionType.swift
//  MeLiApp
//
//  Created by Lili Cabral on 16/09/22.
//

import Foundation
import UIKit

enum SectionType { // 9
    case productPhotos(images: [UIImage]) // 17
    case productInfo(viewModels: [TextCellViewModel])
    case historyProducts(viewModels: [HistoryProductTableViewCellViewModel])
    
    var title: String? { // 25
        switch self {
        case .historyProducts:
            return "Visto recentemente"
        default:
            return nil
        }
    }
}
