//
//  TextCellViewModel.swift
//  MeLiApp
//
//  Created by Lili Cabral on 16/09/22.
//

import Foundation
import UIKit

struct TextCellViewModel{
    let text: String
    let font: UIFont
}

extension UITableViewCell { // 23
    func configure(width viewModel: TextCellViewModel) {
        textLabel?.text = viewModel.text
        textLabel?.numberOfLines = 0
        textLabel?.font = viewModel.font
    }
}
