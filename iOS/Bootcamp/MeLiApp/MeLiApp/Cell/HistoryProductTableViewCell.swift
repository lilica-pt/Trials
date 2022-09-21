//
//  RelatedProductTableViewCell.swift
//  MeLiApp
//
//  Created by Lili Cabral on 12/09/22.
//

import UIKit
import SwiftUI

struct HistoryProductTableViewCellViewModel {
    let image: UIImage?
    let title: String
}

class HistoryProductTableViewCell: UITableViewCell {
    
    static let identifier = "HistoryProductTableViewCell"
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray2
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(productImageView)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            productImageView.widthAnchor.constraint(equalToConstant: 100),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 100),
            
            label.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: productImageView.centerYAnchor),
            label.heightAnchor.constraint(equalTo: productImageView.heightAnchor)
        ])
    }
    
    public func configure(width viewModel: HistoryProductTableViewCellViewModel) {
        label.text = viewModel.title
        productImageView.image = viewModel.image
    }
    
}
